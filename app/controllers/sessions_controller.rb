class SessionsController < ApplicationController

  before_action :redirect_logged_in, only: [:new]

  def new
    render :new
  end

  def create
    @user = User.find_by_login(clean_params)
    if @user
      self.login(@user)
      redirect_to root_path
    else
      flash.now[:errors]= ["invalid login"]
      render :new
    end
  end

  def destroy
    session[:session_token] = nil
    redirect_to root_path
  end

private
  def clean_params
    params.require(:user).permit(:username, :password)
  end

  def redirect_logged_in
    redirect_to root_path if self.logged_in?
  end

end
