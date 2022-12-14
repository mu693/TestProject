class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_notifications, if: :current_user
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  include Pagy::Backend

  private

  def set_notifications
    @notifications = Notification.where(doctor_id: current_user.id)
  end  

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back(fallback_location: root_path)
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  def ensure_current_user
    return unless current_user.nil?

    redirect_to '/'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :name, :lname, :avatar, :role)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :lname, :avatar, :email, :specialization, :experience, :password, :current_password)
    end
  end
end
