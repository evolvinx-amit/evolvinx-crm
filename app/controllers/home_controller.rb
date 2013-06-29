class HomeController < ApplicationController
  before_filter :check_if_login
  def index
  end

  protected

  def check_if_login
    if session[:userrole].present?

    else
      redirect_to(login_path)
    end
  end
end
