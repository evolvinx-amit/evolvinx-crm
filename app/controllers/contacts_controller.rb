class ContactsController < ApplicationController
  before_filter :check_if_login

  def index
    @contacts = Contact.find(:all)
    respond_to do |format|
      format.html
      format.js
    end
  end


  protected
  def check_if_login
    if session[:userrole].present?

    else
      redirect_to(login_path)
    end
  end
end
