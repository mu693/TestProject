class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # @currently_user = current_user.id
    @users = User.all_except(current_user)
  end

  def destroy
    @user = User.find(params[:id])
    respond_to do |format|
      @user.destroy
      format.html { redirect_to users_url, notice: 'Selected User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
