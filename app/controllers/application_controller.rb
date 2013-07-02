class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  def current_user
     @current_user ||= User.find_by_id(session[:userid]) if session[:userid] && @current_user.nil?
    @current_user
  end

  def authenticate_user
    if current_user.nil?
      flash[:error] = 'You must be signed in to view that page.'
      redirect_to :root
    end
  end
end
