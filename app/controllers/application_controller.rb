class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  include Pagy::Backend

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
  
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def ensure_current_user
    if current_user.nil?
      redirect_to "/"
    end  
  end  
    
  protected
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :name, :lname, :avatar, :role, :approved)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :lname, :avatar, :email, :password, :current_password, :approved)}
  end
end
