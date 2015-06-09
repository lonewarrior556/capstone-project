class ApiQuestionsController < ApplicationController

  before_action :need_login

  def index
    @questions = Question.all.limit(25 + sanitize_page)
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
    if @question.save
      render json: @question
    else
      render json: @question.errors , status: :unproccessable_entity
    end
  end

  def search
    @query = params[:search]
    @query = "" if @query.nil?
    query = @query.gsub(/\W+/, ' ').split(" ")
    user_query = (["username like ?"]* query.length).join(" or ")
    question_and_query = (["title like ?"]* query.length).join(" and ")
    question_or_query = (["title like ?"]* query.length).join(" or ")
    keys = ("%" + query.join("%,%") + "%").split(",")
    @users = User.where(user_query, *keys)
    @questions = Question.where(question_and_query, *keys)
    @questions = Question.where(question_or_query, *keys) if @questions.empty?

    render 'sessions/search', layout: false
  end

private
  def clean_params
    params.require(:api_question).permit(:title, :body)
  end

end
