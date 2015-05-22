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

  def update_current_user
    @user = current_user
    @user.avatar = params[:avatar]

      User.skip_callback(:save, :before, :generate_session_token)
    if @user.save
      User.set_callback( :save, :before, :generate_session_token)
      render :user_images
    else
      User.set_callback( :save, :before, :generate_session_token)
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :fname, :lname, :password, :avatar)
    end

end
