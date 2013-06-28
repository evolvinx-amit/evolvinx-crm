class UsersController < ApplicationController
  def index
  end

  def login
    if(request.post?) then
        @_userName = params[:username]
        @_password = params[:password]
        @find = User.where("username = ? AND password = ?", @_userName, @_password)
        if @find.empty?
          flash[:notice] = 'Login credential errors'
          redirect_to :action => :login
        else
          @find = User.where("username = ? AND password = ?", @_userName, @_password).first
          session[:username] = @find.username
          session[:useremail] = @find.email
          session[:userid] = @find.id
          session[:userrole] = @find.role_id
          redirect_to(index_path)
        end
    end
    @user = User.new
  end

  def logout
    reset_session
    redirect_to(login_path)
  end

end
