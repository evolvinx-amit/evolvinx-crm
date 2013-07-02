class AccountsController < ApplicationController
  before_filter :authenticate_user

  def index
    @accounts = Account.find(:all)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(params[:account])
    @account[:owner] =  session[:userid]
    respond_to do |format|
      begin
        if @account.save
          format.json { render :json => {"success" => true, "message" => "Successfully created!"} }
        else
          format.json { render :json => {"error" => true, "exception" => @account.errors.full_messages.to_sentence} }
        end
      rescue =>e
        @error= e.message
        format.json { render :json => {"error" => true, "exception" => @error} }
      end
    end
  end

  def show
    @title = t "account.t_view"
    @account = Account.find(params[:id])
  end

  def edit
    @title = t "account.t_edit_account"
    @account = Account.find(params[:id])
  end

  def update
    @title = t "account.t_update_account"
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

  def get_contacts
    @accId = params[:id]
    @contacts = Contact.find(:all, :conditions => [ "account_name = ?", @accId ])
    respond_to do |format|
      format.json { render :json => {"success" => true, "message" => "Successfully created!"} }
    end
  end

  def destroy
    @title = t "account.t_delete_account"
    @account = Account.find(params[:id])
    @account.destroy
    respond_to do |format|
      flash[:notice] = "Account deleted successfully!"
      format.html { redirect_to(accounts_path) }
    end
  end

end
