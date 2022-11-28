class PatientAppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  before_action :set_appointment, only: %i[show edit update destroy]

  def index
    @patient_appointments = PatientAppointment.all if current_user.admin? || current_user.doctor?
    return unless current_user.patient?

    @patient_appointments = current_user.patient_appointments.all

    if params[:appointment_date].blank?
      @patient_appointments = PatientAppointment.not_yet_done.order("created_at DESC")
    end 

  end

  def history
    if params[:appointment_date].blank?
      @patient_appointments = PatientAppointment.previous_appointment.order("created_at DESC")
    end   
  end  

  def new
    @appointment_dates = AppointmentDate.where(user_id: params[:user])
    render_format
    @patient_appointment = PatientAppointment.new
    authorize @patient_appointment
  end

  def create
    if params[:user].present? && params[:date].present?
      s = params[:date].delete! '""'
      date = Date.parse(s)
      @patient_appointment = current_user.patient_appointments.create(user_id: params[:user], date: date)
      user = current_user
      @user = user.email
      PatientAppointmentMailer.appointment_created(@user).deliver_now
    end
    respond_to do |_format|
      SendEmailToPatientJob.perform_later
      redirect_to patient_appointments_url
      flash[:notice] = 'Appointment was successfully created.'
    end
  end

  def show
    @patient_appointment = PatientAppointment.find(params[:id])
  end

  def destroy
    @patient_appointment = PatientAppointment.find(params[:id])
    authorize @patient_appointment
    @patient_appointment.destroy
    respond_to do |format|
      format.html { redirect_to patient_appointments_url, notice: 'Selected appointment was successfully destroyed.' }
    end
  end

  def all_doctor
    @users = User.where(role: 'doctor').all
  end

  private

  def redirect
    redirect_to patient_appointments_path
  end

  def patient_appointment_params
    params.require(:patient_appointment).permit(:user_id, :date)
  end

  def current_appointment
    @patient_appointment = PatientAppointment.find(params[:id])
  end

  def set_appointment
    @patient_appointment = PatientAppointment.find(params[:id])
  end

  def render_format
    if params[:user]
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.html
      end
    end
  end
end
