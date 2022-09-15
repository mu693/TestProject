class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  
  def index
  end
end
