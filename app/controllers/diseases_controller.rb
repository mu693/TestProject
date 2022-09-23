class DiseasesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  respond_to :html, :json, :js
  before_action :set_disease, only: %i[ :show :edit :update :destroy ]

  def index
    #binding.pry
    @pagy, @diseases = pagy(current_user.diseases)
    
    #Searching
    if params[:search].present?
      @search_disease = current_user.diseases.where("name ILIKE ?", "%#{params[:search]}%")
      # respond_to do |format|
      #   format.js
      # end  
    else
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

  # GET /diseases/new
  def new
    @disease = Disease.new
  end

  # Create Disease
  def create
    @disease = current_user.diseases.new(disease_params)

    # Saving medicine in disease
    disease_medicines = params[:disease][:medicine_ids].shift
    disease_medicines  = params[:disease][:medicine_ids]

    respond_to do |format|
      if @disease.save 
          disease_medicines&.each do |m|
          @medicine = MedicineDisease.create(disease_id: @disease.id , medicine_id: m)
          @medicine.save
          format.html { redirect_to diseases_url(@disease), notice: "Disease was successfully created." }
          format.json { render :index, status: :created, location: @disease }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # Edit Disease
  def edit
    @disease = current_user.diseases.find(params[:id])
  end

  # Update Disease
  def update
    @disease = Disease.find(params[:id])

    # Updating selected Medicines
    disease_medicines = @disease.medicine_diseases

    # destroying medicine
    disease_medicines.destroy_all
     
    respond_to do |format|
      if @disease.update(disease_params)
        
        # again adding medicines
        params[:disease][:medicine_ids]&.each do |m|
          @medicine = MedicineDisease.create(disease_id: @disease.id , medicine_id: m)
          @medicine.save

        format.html { redirect_to diseases_url, notice: "Disease was successfully updated." }
        format.json { render :index, status: :ok, location: @disease }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end
   
  # Show each record
  def show
    @disease = current_user.diseases.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", template: "diseases/disease", formats: [:html]
      end
    end
  end

  # Disease Destroy
  def destroy
    @disease = Disease.find(params[:id])
    @disease.destroy
    respond_to do |format|
      format.html { redirect_to diseases_url, notice: "Selected Disease was successfully destroyed." }
      format.json { head :no_content }
    end
  end
 
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_disease
      @disease = current_user.diseases.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def disease_params
      params.require(:disease).permit(:name, :code, :status, :medicines_ids, :destroy)
    end

    def current_disease
      @disease = Disease.find(params[:id])
    end
end
