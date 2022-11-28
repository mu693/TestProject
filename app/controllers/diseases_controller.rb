class DiseasesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  respond_to :html, :json, :js
  before_action :set_disease, only: %i[show edit update destroy]
  # include Diseases

  def index
    @pagy, @diseases = pagy(Disease)
    @search_disease = Disease.searched(params[:search]) if params[:search].present?
    respond_to do |format|
      format.html
      format.js
      format.pdf do
        render pdf: 'Diseases', template: 'diseases/record', formats: [:html]
      end
    end
  end

  def new
    @disease = Disease.new
    authorize @disease
  end

  def create
    @disease = current_user.diseases.new(disease_params)

    # Saving medicine in disease
    disease_medicines = params[:disease][:medicine_ids].shift
    disease_medicines = params[:disease][:medicine_ids]

    return unless @disease.save

    # medicines
    disease_medicines&.each do |m|
      @medicine = MedicineDisease.create(disease_id: @disease.id, medicine_id: m)
      @medicine.save
      # UserDisease.create(disease_id: @disease.id  , user_id: params[:disease][:user_disease_ids] )
      redirect_to diseases_url
      flash[:notice] = 'Disease was successfully created.'
    end
  end

  def edit
    @disease = Disease.find(params[:id])
    authorize @disease
  end

  def update
    authorize @disease
    @disease = Disease.find(params[:id])
    disease_medicines = @disease.medicine_diseases
    disease_medicines.destroy_all
    respond_to do |format|
      if @disease.update(disease_params)
        params[:disease][:medicine_ids]&.each do |m|
          @medicine = MedicineDisease.create(disease_id: @disease.id, medicine_id: m)
          @medicine.save
        end
        # params[:disease][:doctor_ids]&.each do |d|
        #   @doctor = DiseaseDoctor.create(disease_id: @disease.id, doctor_id: d)
        #   @doctor.save
        format.html { redirect_to diseases_url, notice: 'Disease was successfully updated.' }
        format.json { render :index, status: :ok, location: @disease }
      end
    end
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
    params.require(:disease).permit(:name, :code, :status, :medicines_ids, :user_id)
  end

  def current_disease
    @disease = Disease.find(params[:id])
  end
end
