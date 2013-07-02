class UsersController < ApplicationController
  before_filter :authenticate_user
  def new
    @user = User.new
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
    respond_to do |format|
      begin
        update_authentication_token(@user, nil)
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

  
  private
  
  def update_authentication_token(user, remember_me)
    if remember_me == 1
      auth_token = SecureRandom.urlsafe_base64
      user.authentication_token = auth_token
      cookies.permanent[:auth_token] = auth_token
    else
      user.authentication_token = nil
      cookies.permanent[:auth_token] = nil
    end
  end
  
end
