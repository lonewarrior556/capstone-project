class ResponsesController < ApplicationController

  def create
    question_id = clean_params[:question_id]
    @response = Response.new(user_id: current_user.id)
    @response.question_id = question_id
    @response.body= clean_params[:body]
    if @response.save
      redirect_to question_url(question_id)
    else

    end

  end


private
  def clean_params
    params.require(:response).permit(:question_id,:body)
  end

end
