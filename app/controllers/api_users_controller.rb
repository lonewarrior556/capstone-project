class ApiUsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def show
    @thyself = false
    @user = User.find(params[:id])
    if @user == current_user
      @thyself = true
    end
    @questions = Question.all.where(user_id: params[:id]).includes(:responses)
    @responses = Response.all.where(user_id: params[:id]).includes(:question)
    render :show
  end











end
