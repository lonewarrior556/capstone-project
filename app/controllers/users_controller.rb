class UsersController < ApplicationController

  before_action :redirect_logged_in, only: [:new]


  def index
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      self.login(@user)
      redirect_to root_path
    else
      flash.now[:errors]=@user.errors.full_messages
      render :new
    end
  end


private
  def user_params
    params.require(:user).permit(:email, :username, :fname, :lname, :password)
  end

  def redirect_logged_in  
    redirect_to root_path if self.logged_in?
  end

end
