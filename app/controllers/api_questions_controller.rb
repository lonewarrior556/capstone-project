class ApiQuestionsController < ApplicationController

  before_action :need_login

  def index
    @questions = Question.all
    @questions.each do |question|
      question.responds = question.responses.length
    end
    render :index
  end

  def show
    @question = Question.find(params[:id])

    render :show
  end

  def create
    @question = Question.new(clean_params)
    @question.user_id = current_user.id
    @question.save
    render json: @question
  end

private
  def clean_params
    params.require(:api_question).permit(:title, :body)
  end

end
