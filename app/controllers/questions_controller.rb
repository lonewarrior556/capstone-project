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
    @responses = Response.includes(:responder).where(question_id: @question.id)
    render :show
  end

  def create
    @question = Question.new(clean_params)
    @question.user_id = current_user
    @question.save
    redirect_to root_path

  end

private

  def clean_params
    params.require(:question).permit(:title, :body)
  end
end
