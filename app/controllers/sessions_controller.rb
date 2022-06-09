class SessionsController < ApplicationController

  def login
  end

  def post_login
      @user = User.find_by(name: params[:name])
      if @user && @user.authenticate(params[:password])
          log_in(@user)
          redirect_to root_path, notice: "You are successfully logged-in as #{@user.name}"
      else
          flash[:alert] = "Invalid Credentials!!"
          render :login, status: :unprocessable_entity
      end
  end

  def log_out # this is controller's action
      logout # this is calling helper method 
      redirect_to login_path, status: :see_other 
  end

end
