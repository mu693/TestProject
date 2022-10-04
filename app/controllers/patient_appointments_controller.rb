class PatientAppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  before_action :set_appointment, only: %i[ show edit update destroy ]

  def index
    # @appointment_dates = AppointmentDate.where(
    #   start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
    # )
    
    @appointment_dates = AppointmentDate.where( doctor_id: params[:doctor])
      render_format

    @patient_appointments = PatientAppointment.all
    @patient_appointment = PatientAppointment.new
      
  end

  def create
    debugger
    @patient_appointment = PatientAppointment.new(patient_appointment_params)

    respond_to do |format|
      if @patient_appointment.save
        format.html { redirect_to patient_appointments_url, notice: "Appointment was successfully created." }
        format.json { render :index, status: :created, location: @patient_appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patient_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @patient_appointment = PatientAppointment.find(params[:id])
  end

  def update
    respond_to do |format|
      if @patient_appointment.update(patient_appointment_params)
        format.html { redirect_to patient_appointments_url, notice: "Appointment was successfully updated." }
        format.json { render :index, status: :ok, location: @patient_appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patient_appointment.errors, status: :unprocessable_entity }
      end
    end
  end 

  def show
    @patient_appointment = PatientAppointment.find(params[:id])
  end

  def destroy
    @patient_appointment = PatientAppointment.find(params[:id])
    @patient_appointment.destroy

    respond_to do |format|
      format.html { redirect_to patient_appointments_url, notice: "Selected appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_appointment
      @patient_appointment = PatientAppointment.find(params[:id])
    end

    def patient_appointment_params
      params.require(:patient_appointment).permit(:doctor_id, :date, :appointment_date_id)
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
