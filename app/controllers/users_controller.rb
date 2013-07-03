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

  def show
    @title = t "user.t_view"
    @user = User.find(params[:id])
  end

  def edit
    @title = t "user.t_edit_user"
    @user = User.find(params[:id])
  end
  
  def update
    @title = t "user.t_update_user"
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => ("Successfully updated the user") ) }
      else
        flash[:error] = @user.errors.full_messages.to_sentence
        format.html { redirect_to :action => "edit" }
      end
    end
  end

  def destroy
    @title = t "user.t_delete_user"
    @user = User.find(params[:id])
    if(current_user.id == @user.id)
      respond_to do |format|
        flash[:error] = "You can't delete yourself!"
        format.html { redirect_to(users_path) }
      end
    else
      @user.destroy
      respond_to do |format|
        flash[:notice] = "User deleted successfully!"
        format.html { redirect_to(users_path) }
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
