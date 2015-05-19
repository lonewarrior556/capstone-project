class QuestionsController < ApplicationController

  before_action :redirect_logged_in, only:[:create, :unanswered, :show, :index]

  def index
    @questions = Question.all.reverse #sorted by reverse created
    render :index
  end

  def top
    @questions = Question.all.sort_by{|a| a.responses.length}.reverse #sorted by most responses /votes
    render :top
  end

  def unanswered
    @questions = Question.all.select{|question| !question.best_answer_id}
    render :unanswered
  end

  def show
    @question = Question.find(params[:id])
    @responses = Response.includes(:user).where(question_id: @question.id)
    render :show
  end

  def new
    redirect_to new_sessions_url
  end

private

  def clean_params
    params.require(:question).permit(:title, :body)
  end
end
