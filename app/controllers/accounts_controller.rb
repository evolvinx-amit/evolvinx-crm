class AccountsController < ApplicationController
  before_filter :check_if_login

  def index
    @accounts = Account.find(:all)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @title = t "account.t_view"
    @account = Account.find(params[:id])
  end

  def edit
    @title = t "lead.t_edit_account"
    @account = Account.find(params[:id])
  end

  def update
    @title = t "user.t_update_account"
    @account = Account.find(params[:id])
    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to(@account, :notice => ("Successfully updated the account") ) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @account.errors, :status => :unprocessable_entity }
      end
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
