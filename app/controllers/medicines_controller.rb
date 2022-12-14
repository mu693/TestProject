class MedicinesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  respond_to :html, :json, :js
  before_action :set_medicine, only: %i[show edit update destroy]

  def index
    @pagy, @medicines = pagy(Medicine.all)
    @search_medicine = Medicine.searched(params[:search]) if params[:search].present?
    respond_to do |format|
      format.html
      format.js
      format.pdf do
        render pdf: 'Medicines', template: 'medicines/medicine_records', formats: [:html]
      end
    end
  end

  def new
    @medicine = Medicine.new
    authorize @medicine
  end

  def create
    @medicine = current_user.medicines.new(medicine_params)
    respond_to do |format|
      if @medicine.save
        format.html { redirect_to medicines_url, notice: 'Medicine was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    authorize @medicine
    @medicine = Medicine.find(params[:id])
  end

  def update
    @medicine = Medicine.find(params[:id])
    respond_to do |format|
      if @medicine.update(medicine_params)
        format.html { redirect_to medicines_url, notice: 'Medicine was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def show
    @medicine = Medicine.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'file_name', template: 'medicines/medicine', formats: [:html]
      end
    end
  end

  def destroy
    @medicine = Medicine.find(params[:id])

    # Admin authorization
    authorize @medicine

    @medicine.destroy
    respond_to do |format|
      format.html { redirect_to medicines_url, notice: 'Selected Medicine was successfully destroyed.' }
    end
  end

  private

  def set_medicine
    @medicine = Medicine.find(params[:id])
  end

  def medicine_params
    params.require(:medicine).permit(:name, :description, :quantity, :price, :manfucturing_date, :expiry_date)
  end

  def current_medicine
    @medicine = Medicine.find(params[:id])
  end
end
