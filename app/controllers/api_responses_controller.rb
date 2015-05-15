class ApiResponsesController < ApplicationController

  def index
    @responses = Response.where(question_id: params[:api_question_id])
    render json: @responses
  end




end
