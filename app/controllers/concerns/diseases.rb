module Diseases
  ActiveSupport::Concern

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

    def create
      @disease = current_user.diseases.new(disease_params)
    
      # Saving medicine in disease
      disease_medicines = params[:disease][:medicine_ids].shift
      disease_medicines = params[:disease][:medicine_ids]
     
      # Saving doctors in disease
      disease_doctors = params[:disease][:doctor_ids].shift
      disease_doctors = params[:disease][:doctor_ids]
    
      return unless @disease.save
    
      # medicines
      disease_medicines&.each do |m|
        @medicine = MedicineDisease.create(disease_id: @disease.id, medicine_id: m)
        if @medicine.save
        # doctors
          disease_doctors&.each do |d|
            @doctor = DiseaseDoctor.create(disease_id: @disease.id, doctor_id: d)
            @doctor.save
            @doctor_name = @disease.user_id
            redirect_to diseases_url
            flash[:notice] = 'Disease was successfully created.'
          end
        end
      end
    end

    def update
      authorize @disease
      @disease = Disease.find(params[:id])
      disease_medicines = @disease.medicine_diseases
      disease_medicines.destroy_all
      disease_doctors = @disease.disease_doctors
      disease_doctors.destroy_all
      respond_to do |format|
        if @disease.update(disease_params)
          params[:disease][:medicine_ids]&.each do |m|
            @medicine = MedicineDisease.create(disease_id: @disease.id, medicine_id: m)
            @medicine.save
          end
          params[:disease][:doctor_ids]&.each do |d|
            @doctor = DiseaseDoctor.create(disease_id: @disease.id, doctor_id: d)
            @doctor.save
            format.html { redirect_to diseases_url, notice: 'Disease was successfully updated.' }
            format.json { render :index, status: :ok, location: @disease }
          end
        end
      end
    end  
end