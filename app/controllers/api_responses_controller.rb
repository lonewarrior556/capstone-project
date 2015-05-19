class ApiResponsesController < ApplicationController

  before_action :need_login


  def index
    @responses = Response.where(question_id: params[:api_question_id]).includes(:user)

    render :index
  end




end
