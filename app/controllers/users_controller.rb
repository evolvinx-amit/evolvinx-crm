class UsersController < ApplicationController
  before_filter :check_if_login
  def new
    @user = User.new
    @roles = Role.find(:all)
  end

  def index
      @users = User.find(:all)
      respond_to do |format|
        format.html
        format.js
      end
  end

  def create
    @user = User.new(params[:user])
    @user[:password] =  Digest::MD5.hexdigest(@user[:password])
    respond_to do |format|
      begin
        if @user.save
          format.json { render :json => {"success" => true, "message" => "Successfully created!"} }
        else
          format.json { render :json => {"error" => true, "exception" => @user.errors.full_messages.to_sentence} }
        end
      rescue =>e
        @error= e.message
        format.json { render :json => {"error" => true, "exception" => @error} }
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
