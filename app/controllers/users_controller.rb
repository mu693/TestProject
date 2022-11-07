class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_courier, only: %i[ show edit update destroy ]

  def index
    # @currently_user = current_user.id
    @users = User.all_except(current_user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Selected User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create
    @user = User.where(role: 'doctor').call(user_params)
  end

  def edit
    @user = User.where(role: 'doctor').find(params[:id])
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'Doctor was successfully Approved.' }
        format.json { render :index, status: :ok, location: @user }
      end
    end
  end

  def show; end

  private

  def set_courier
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:approved)
  end
end
