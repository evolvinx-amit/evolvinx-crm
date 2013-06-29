class UserSessionsController < ApplicationController
  def new
    if(request.post?) then
        @_userName = params[:username]
        @_password =  Digest::MD5.hexdigest(params[:password])
        @find = User.where("username = ? AND password = ?", @_userName, @_password)
        if @find.empty?
          flash[:error] = 'Login credential errors'
          redirect_to(root_path)
        else
          @find = User.where("username = ? AND password = ?", @_userName, @_password).first
          session[:username] = @find.username
          session[:useremail] = @find.email
          session[:userid] = @find.id
          session[:userrole] = @find.role_id
          redirect_to(home_index_path)
        end
    end
    @user = User.new
  end

  def destroy
    reset_session
    redirect_to(login_path)
  end
end
