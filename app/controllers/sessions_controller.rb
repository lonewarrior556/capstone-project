class SessionsController < ApplicationController

  before_action :redirect_logged_in, only: [:new, :create, :omniauth_callback]





  def new
    @projects=[]
    GlobalConstants::ALL_PROJECTS.each do |( name, link)|
      code_bar = Typhoeus.get( link, followlocation: true).response_body
      code_bar= code_bar[code_bar.index('<div class="repository-lang-stats-graph')..-1]
      code_bar= code_bar[0..code_bar.index("</div>")+6]
      code_bar= code_bar[code_bar.index(">")+6..-11]
      @projects << [name, code_bar]
    end
    render :new
  end

  def create
    @user = User.find_by_login(clean_params)

    if @user
      self.generate_session_token
      self.login(@user)
      redirect_to root_path
    else
      flash.now[:errors]= ["invalid login"]
      render :new
    end
  end

  def omniauth_callback
    @user = User.from_omniauth(env["omniauth.auth"])
    if @user.save
      self.login(@user)
      redirect_to root_path
    else
      redirect_to auth_failure_url
    end
  end

  def search
    @query = params[:search]
    query = @query.gsub(/\W+/, ' ').split(" ")

    user_query = (["email like ?"]* query.length).join(" or ")
    question_and_query = (["title like ?"]* query.length).join(" and ")
    question_or_query = (["title like ?"]* query.length).join(" or ")
    keys = ("%" + query.join("%,%") + "%").split(",")
    @users = User.where(user_query, *keys)
    @questions = Question.where(question_and_query, *keys)
    @questions = Question.where(question_or_query, *keys) if @questions.empty?

    render :search
  end

  def destroy
    current_user.generate_session_token
    current_user.save
    logout
    redirect_to root_path
  end

private
  def clean_params
    params.require(:user).permit(:username, :password)
  end

  def redirect_logged_in
    redirect_to root_path if self.logged_in?
  end

end
