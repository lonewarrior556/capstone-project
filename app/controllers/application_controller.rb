class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :login, :logged_in?, :logout

  def login(user)
    session[:session_token] = user.session_token
  end

  def logout
    session[:session_token] = nil
  end

  def current_user
    # dev
    return User.first
    # dev
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end


end
