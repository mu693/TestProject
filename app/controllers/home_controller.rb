class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user

  def index; end

  # def trigger_job
  #   HelloWorldJob.perform_later
  #   redirect_to patient_appointments_job_done_path
  # end
end
