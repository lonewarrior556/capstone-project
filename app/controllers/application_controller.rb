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
    return nil
    # dev
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def redirect_logged_in
    if logged_in?
      redirect_to root_path+"#"+request.env['PATH_INFO'][1..-1]
    end
  end

end
