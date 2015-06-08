class QuestionsController < ApplicationController

  before_action :redirect_logged_in, only:[:create, :unanswered, :show, :index, :top]
  before_action :redirect_not_logged_in, only:[:root_page]

  def root_page
    render :root_page
  end

  def index
    @questions = Question.includes(:responses).all.order('id DESC').limit(25).offset(sanitize_page) #sorted by reverse created
    render :index
  end

  def top
    @questions = Question.top25.offset(sanitize_page)
    render :top
  end

  def unanswered
    @questions = Question.all.where(best_answer_id: nil).limit(25)
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

  def redirect_not_logged_in
    if !logged_in?
      redirect_to questions_top_url
    end
  end

  def clean_params
    params.require(:question).permit(:title, :body)
  end


end
