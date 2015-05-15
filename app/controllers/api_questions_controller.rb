class ApiQuestionsController < ApplicationController

  def index
    @questions = Question.all
    @questions.each do |question|
      question.responds = question.responses.length
    end
    render :index
  end

  def show
    @question = Question.find(params[:id])
    render json: @question
  end



end
