class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    render :index
  end

  def show
    @question = Question.find(params[:id])
    render :show
  end

  def create
    @question = Question.new(clean_params)
    @question.user_id = 1
    @question.save
    redirect_to root_path

  end

private

  def clean_params
    params.require(:question).permit(:title, :body)
  end
end
