class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  before_action :set_doctor, only: %i[show edit update destroy]

  def index
    @doctor = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    respond_to do |format|
      if @courier.save
        format.html { redirect_to doctors_url, notice: 'Doctor was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    respond_to do |format|
      if @courier.update(courier_params)
        format.html { redirect_to doctors_url, notice: 'Doctor was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Selected doctor was successfully destroyed.' }
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :description)
  end

  def current_doctor
    @doctor = Doctor.find(params[:id])
  end
end
