class UsersController < ApplicationController

  before_action :redirect_logged_in

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def random_sign_up
    @names = "Velvet Banks,Lemon Jello,Richard Cox,Justin Case,Lighten up,Ronald McDonald,Neit Ballsack,Norman Bates,Quentin Quale,Jeeves Wooster,Snooki Prince,Dick Less,Hives Butler,Molly Warmflash,Pussy Galore,Tiffany Case,Holly Goodhead,Monly Jones,Bawana Fana,Draco Malfoy,Andreas Gimli,Bella Buttcheeks,Buzz Lightyear,Harry Wang,San Juniper,Ben Purr,Bonly Stuart,Robert Roberts,Bong Queesha,Gypsy Starblanket,Mary McDonald,Billy Bob,Harry Glands".split(",")
    name = @names.sample.split(" ")

    username = "pee_pee_longstocking" + rand(999).to_s
    @user = User.new(username: username, email: username+"@email.com", fname: name[0], lname: name[1] )
    @user.password = "password"
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      self.login(@user)
      redirect_to root_path
    else
      flash.now[:errors]=@user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @questions = Question.where(user_id: @user.id)
    @resps = Response.includes(:question).where(user_id: @user.id)
    render :show
  end

 private
  def user_params
    params[:user][:avatar] = params[:user][:avatar2] if params[:user][:avatar].nil?
    params.require(:user).permit(:email, :username, :fname, :lname, :password, :avatar)
  end

end
