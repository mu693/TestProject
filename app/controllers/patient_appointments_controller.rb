class PatientAppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  before_action :set_appointment, only: %i[show edit update destroy]
  
  include PatientAppointments

  def index
    @patient_appointments = PatientAppointment.all if current_user.admin? || current_user.doctor?
    return unless current_user.patient?

    @patient_appointments = current_user.patient_appointments.all
  end

  def new
    @appointment_dates = AppointmentDate.where(doctor_id: params[:doctor])
    render_format
    @patient_appointment = PatientAppointment.new
    authorize @patient_appointment
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

  private

  def redirect
    redirect_to patient_appointments_path
  end

  def set_appointment
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
