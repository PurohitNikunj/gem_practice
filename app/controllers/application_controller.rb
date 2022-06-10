class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :is_authenticated, unless: :ordinary_controller
  before_action :not_loggedin, if: :ordinary_controller
  rescue_from CanCan::AccessDenied do |exception|
      flash[:alert] = "You are not authorized to #{exception.action} this #{exception.subject.class}"
      redirect_to root_path 
  end

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
