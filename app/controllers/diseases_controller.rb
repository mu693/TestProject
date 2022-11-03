class DiseasesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  respond_to :html, :json, :js
  before_action :set_disease, only: %i[ :show :edit :update :destroy ]
 
  def index
    #binding.pry
    @pagy, @diseases = pagy(Disease.all)
    
    #Searching
    if params[:search].present?
      @search_disease = Disease.searched(params[:search])
    end  

     #Downloading record
     respond_to do |format|
      format.html
      format.js
      format.pdf do
        render pdf: "Diseases", template: "diseases/record", formats: [:html]
      end
    end
  end  

  
  def new
    @disease = Disease.new

    # Admin authorization
    authorize @disease
  end

  def create
    @disease = current_user.diseases.new(disease_params)
    
    # Saving medicine in disease
    disease_medicines = params[:disease][:medicine_ids].shift
    disease_medicines  = params[:disease][:medicine_ids]

    #Saving doctors in disease
    disease_doctors = params[:disease][:doctor_ids].shift
    disease_doctors  = params[:disease][:doctor_ids]

      if @disease.save 
        #medicines
        disease_medicines&.each do |m|
          @medicine = MedicineDisease.create(disease_id: @disease.id , medicine_id: m)
          if @medicine.save
            #doctors
            disease_doctors&.each do |d|
              @doctor = DiseaseDoctor.create(disease_id: @disease.id , doctor_id: d)
              @doctor.save
              redirect_to diseases_url
              flash[:notice] = "Disease was successfully created."
            end
          end
        end
    end  
  end
 
  
  def edit
    @disease = Disease.find(params[:id])

    # Admin authorization
    authorize @disease
  end

  # Update Disease
  def update
    @disease = Disease.find(params[:id])

    # Admin authorization
    authorize @disease
    
    # Updating selected Medicines
    disease_medicines = @disease.medicine_diseases

    # Updating selected Doctors
    disease_doctors = @disease.disease_doctors

    # Destroying medicine
    disease_medicines.destroy_all

    # Destroying doctors
    disease_doctors.destroy_all
     
    respond_to do |format|
      if @disease.update(disease_params)
        
        # again adding medicines
        params[:disease][:medicine_ids]&.each do |m|
          @medicine = MedicineDisease.create(disease_id: @disease.id , medicine_id: m)
          @medicine.save
        end 
        params[:disease][:doctor_ids]&.each do |d|
          @doctor = DiseaseDoctor.create(disease_id: @disease.id, doctor_id: d)
          @doctor.save         

          format.html { redirect_to diseases_url, notice: "Disease was successfully updated." }
          format.json { render :index, status: :ok, location: @disease }
        end
      end
    end        
  end
   
 
  def show 
    @disease = Disease.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", template: "diseases/disease", formats: [:html]
      end
    end
  end

  
  def destroy
    @disease = Disease.find(params[:id])
    # Admin authorization
    authorize @disease

    @disease.destroy
    respond_to do |format|
      format.html { redirect_to diseases_url, notice: "Selected Disease was successfully destroyed." }
      format.json { head :no_content }
    end
  end
 
  private
  
  def set_disease
      @disease = Disease.find(params[:id])
    end

    
    def disease_params
      params.require(:disease).permit(:name, :code, :status, :medicines_ids, :doctor_ids)
    end

    def current_disease
      @disease = Disease.find(params[:id])
    end
end