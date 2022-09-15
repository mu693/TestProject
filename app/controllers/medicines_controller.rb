class MedicinesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  respond_to :html, :json, :js
  before_action :set_medicine, only: %i[ show edit update destroy ]

  # All Medicines Data
  def index
  
   @pagy, @medicines = pagy(current_user.medicines)

    if params[:search].present?
      @search_medicine = current_user.medicines.where("name ILIKE ?", "%#{params[:search]}%")

      respond_to do |format|
        format.js
      end
    else
    end  
  end


  # GET /medicines/new
  def new
    @medicine = Medicine.new
  end

  # Create medicine
  def create
    #@medicine = Medicine.new(medicine_params)
    @medicine = current_user.medicines.new(medicine_params)

    respond_to do |format|
      if @medicine.save
        format.html { redirect_to medicines_url(@medicine), notice: "Medicine was successfully created." }
        format.json { render :index, status: :created, location: @medicine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # Edit medicine
  def edit
    @medicine = current_user.medicines.find(params[:id])
  end

  # Update medicine
  def update
    @medicine = Medicine.find(params[:id])
    respond_to do |format|
      if @medicine.update(medicine_params)
        format.html { redirect_to medicines_url(@medicine), notice: "Medicine was successfully updated." }
        format.json { render :index, status: :ok, location: @medicine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # Show Medicine
  def show
    @medicine = current_user.medicines.find(params[:id])
  end

  # Delete Medicine
  def destroy
    @medicine = Medicine.find(params[:id])
    @medicine.destroy

    respond_to do |format|
      format.html { redirect_to medicines_url, notice: "Selected Medicine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicine
      @medicine = current_user.medicines.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medicine_params
      params.require(:medicine).permit(:name, :description, :quantity, :price, :manfucturing_date, :expiry_date)
    end

    def current_medicine
      @medicine = Medicine.find(params[:id])
    end
end
