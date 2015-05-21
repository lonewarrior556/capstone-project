class ApiUsersController < ApplicationController

  before_action :need_login

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    @thyself = (@user == current_user)
    @questions = Question.all.where(user_id: params[:id]).includes(:responses)
    @responses = Response.all.where(user_id: params[:id]).includes(:question)
    render :show
  end

  def update
    fail
    current_user
    render :index
  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :fname, :lname, :password, :avatar)
    end

end
