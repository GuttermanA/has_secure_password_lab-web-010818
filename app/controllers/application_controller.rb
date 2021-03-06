class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_users

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def is_authenticated?
    if !current_user
      flash[:message] = 'You muts be logged in to do that'
      redirect_to login_path
    end
  end
end
