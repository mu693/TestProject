class DiseasesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  respond_to :html, :json, :js
  before_action :set_disease, only: %i[show edit update destroy]
  include Diseases

  def new
    @disease = Disease.new
    authorize @disease
  end

  def edit
    @disease = Disease.find(params[:id])
    authorize @disease
  end

  def show
    @disease = Disease.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'file_name', template: 'diseases/disease', formats: [:html]
      end
    end
  end

  def destroy
    @disease = Disease.find(params[:id])
    authorize @disease

    @disease.destroy
    respond_to do |format|
      format.html { redirect_to diseases_url, notice: 'Selected Disease was successfully destroyed.' }
    end
  end

  private

  def set_disease
    @disease = Disease.find(params[:id])
  end

  def disease_params
    params.require(:disease).permit(:name, :code, :status, :medicines_ids, :doctor_ids, :user_id)
  end

  def current_disease
    @disease = Disease.find(params[:id])
  end
end
