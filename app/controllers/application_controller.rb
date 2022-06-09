class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :is_authenticated, unless: :ordinary_controller
  before_action :not_loggedin, if: :ordinary_controller


  private
  def is_authenticated
      unless loggedin?
          flash[:alert] = "You should be logged-in to use this service"
          redirect_to login_path
      end
  end

  def not_loggedin
      if loggedin?
          flash[:alert] = "You are already logged-in as #{current_user.name}"
          redirect_to root_path
      end
  end

  def ordinary_controller
      if (params[:controller] == "sessions" && params[:action] != "log_out") || params[:controller] == "users"
          return true
      end
  end
end
