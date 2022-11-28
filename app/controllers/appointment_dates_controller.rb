class AppointmentDatesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  before_action :set_appointment_date, only: %i[show edit update destroy]

  def index
    @appointment_dates = AppointmentDate.all if current_user.admin?
    return unless current_user.doctor?

    @appointment_dates = current_user.appointment_dates.all
  end

  def show
    @appointment_date = AppointmentDate.find(params[:id])
  end

  def new
    @appointment_date = AppointmentDate.new
    authorize @appointment_date
  end

  def edit
    @appointment_date = AppointmentDate.find(params[:id])
    authorize @appointment_date
  end

  def create
    @appointment_date = AppointmentDate.create(appointment_date_params)
    redirect_to appointment_dates_url
  end

  def update
    @appointment_date = AppointmentDate.find(params[:id])
    respond_to do |format|
      dates
      if @appointment_date.update(appointment_date_params)
        format.html do
          redirect_to appointment_dates_url, notice: 'Doctor availability date was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment_date = AppointmentDate.find(params[:id])
    authorize @appointment_date
    @appointment_date.destroy
    respond_to do |format|
      format.html { redirect_to appointment_dates_url, notice: 'Doctor availability date was successfully destroyed.' }
    end
  end

  private

  def set_appointment_date
    @appointment_date = AppointmentDate.find(params[:id])
  end

  def appointment_date_params
    params.require(:appointment_date).permit(:start_time, :end_time, :user_id)
  end
end
