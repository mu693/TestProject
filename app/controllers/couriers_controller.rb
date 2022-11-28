class CouriersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user

  def index
    @pagy, @couriers = pagy(Courier.all)

    return unless params[:search].present?

    @search_courier = Courier.searched(params[:search])
    respond_to do |format|
      format.js
    end
  end

  def new
    @courier = current_user.couriers.new
  end

  def create
    @courier = current_user.couriers.new(courier_params)
    respond_to do |format|
      if @courier.save
        format.html { redirect_to couriers_url, notice: 'Courier was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @courier = Courier.find(params[:id])
  end

  def update
    respond_to do |format|
      if @courier.update(courier_params)
        format.html { redirect_to couriers_url, notice: 'Courier was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def show
    @courier = Courier.find(params[:id])
  end

  def destroy
    @courier = Courier.find(params[:id])
    @courier.destroy
    respond_to do |format|
      format.html { redirect_to couriers_url, notice: 'Selected courier was successfully destroyed.' }
    end
  end

  private

  def set_courier
    @courier = Courier.find(params[:id])
  end

  def courier_params
    params.require(:courier).permit(:name, :address, :code, :contact_no)
  end

  def current_courier
    @courier = Courier.find(params[:id])
  end
end
