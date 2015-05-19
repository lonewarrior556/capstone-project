class ResponsesController < ApplicationController

  def create
    question_id = clean_params[:question_id]
    @response = Response.new(user_id: current_user.id)
    @response.question_id = question_id
    @response.body= clean_params[:body]
    if @response.save
      render json: @response
    else

    end
  end

  # def index
  #   Response.find_by(question_id: params[:question_id])
  # end


private
  def clean_params
    params.require(:response).permit(:question_id,:body)
  end

end
