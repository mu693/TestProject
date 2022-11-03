class CouriersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  before_action :set_courier, only: %i[ show edit update destroy ]

  # All couriers data
  def index
 
  @pagy, @couriers = pagy(Courier.all)

    if params[:search].present?
      @search_courier = Courier.searched(params[:search])
      respond_to do |format|
        format.js
      end
    else
    end  
  end

  # GET /couriers/new
  def new
    @courier = current_user.couriers.new
  end

  # Create Courier
  def create
    #@courier = Courier.new(courier_params)
    @courier = current_user.couriers.new(courier_params)

    respond_to do |format|
      if @courier.save
        format.html { redirect_to couriers_url, notice: "Courier was successfully created." }
        format.json { render :index, status: :created, location: @courier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @courier.errors, status: :unprocessable_entity }
      end
    end
  end

  # Edit Courier
  def edit
    @courier = Courier.find(params[:id])
  end

  # Update Courier
  def update
    respond_to do |format|
      if @courier.update(courier_params)
        format.html { redirect_to couriers_url, notice: "Courier was successfully updated." }
        format.json { render :index, status: :ok, location: @courier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @courier.errors, status: :unprocessable_entity }
      end
    end
  end 

  # Show Courier
  def show
    @courier = Courier.find(params[:id])
  end

  # DELETE Courier
  def destroy
    @courier = Courier.find(params[:id])
    @courier.destroy

    respond_to do |format|
      format.html { redirect_to couriers_url, notice: "Selected courier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courier
      @courier = Courier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def courier_params
      params.require(:courier).permit(:name, :address, :code, :contact_no)
    end

    def current_courier
      @courier = Courier.find(params[:id])
    end
end
