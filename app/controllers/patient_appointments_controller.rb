class PatientAppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  before_action :set_appointment, only: %i[ show edit update destroy ]
  # after_action :redirect, only: [:create]

  def index
    @patient_appointments = PatientAppointment.all
  end

  def new
    @appointment_dates = AppointmentDate.where(doctor_id: params[:doctor])
    render_format
    @patient_appointment = PatientAppointment.new
    # Admin authorization
    authorize @patient_appointment
  end

  def create
    if params[:doctor].present? && params[:date].present?
      s = params[:date].delete! '""'
      date = Date.parse(s)
      @patient_appointment = current_user.patient_appointments.create(doctor_id: params[:doctor], date: date )
      user = current_user
      @user = user.email
      PatientAppointmentMailer.appointment_created(@user).deliver_now
    end
    
    respond_to do |format|
      ##Job
      SendEmailToPatientJob.perform_later

      format.js { redirect_to patient_appointments_url, notice: "Appointment was successfully created." }
      format.html { redirect_to patient_appointments_url, notice: "Appointment was successfully created." }
    end
  end

  def show
    @patient_appointment = PatientAppointment.find(params[:id])
  end

  def destroy
    @patient_appointment = PatientAppointment.find(params[:id])
    # Admin authorization
    authorize @patient_appointment
    @patient_appointment.destroy
    respond_to do |format|
      format.html { redirect_to patient_appointments_url, notice: "Selected appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def redirect
      redirect_to patient_appointments_path
    end

    def set_appointment
      @patient_appointment = PatientAppointment.find(params[:id])
    end

    def patient_appointment_params
      params.require(:patient_appointment).permit(:doctor_id, :date)
    end

    def current_appointment
      @patient_appointment = PatientAppointment.find(params[:id])
    end

    def render_format
      if params[:doctor]
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