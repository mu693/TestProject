class AppointmentDatesController < ApplicationController
  before_action :set_appointment_date, only: %i[ show edit update destroy ]

  # GET /appointment_dates or /appointment_dates.json
  def index
    @appointment_dates = AppointmentDate.all
  end

  # GET /appointment_dates/1 or /appointment_dates/1.json
  def show
  end

  # GET /appointment_dates/new
  def new
    @appointment_date = AppointmentDate.new
  end

  # GET /appointment_dates/1/edit
  def edit
  end

  # POST /appointment_dates or /appointment_dates.json
  def create
    @appointment_date = AppointmentDate.new(appointment_date_params)

    respond_to do |format|
      if @appointment_date.save
        format.html { redirect_to appointment_date_url(@appointment_date), notice: "Appointment date was successfully created." }
        format.json { render :show, status: :created, location: @appointment_date }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointment_dates/1 or /appointment_dates/1.json
  def update
    respond_to do |format|
      if @appointment_date.update(appointment_date_params)
        format.html { redirect_to appointment_date_url(@appointment_date), notice: "Appointment date was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment_date }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointment_dates/1 or /appointment_dates/1.json
  def destroy
    @appointment_date.destroy

    respond_to do |format|
      format.html { redirect_to appointment_dates_url, notice: "Appointment date was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment_date
      @appointment_date = AppointmentDate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_date_params
      params.require(:appointment_date).permit(:doctor_id, :start_time, :end_time)
    end
end
