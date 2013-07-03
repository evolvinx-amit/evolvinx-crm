class UserSessionsController < ApplicationController
  def new
    if(request.post?) then
      username_or_email = params[:username]
      user = verify_user(username_or_email)
      if user
        update_authentication_token(user, params[:remember_me])
        user.last_logged_at = DateTime.now
        user.save
        session[:userid] = user.id
        redirect_to(home_index_path)
      else
        flash.now[:error] = 'Unknown user.  Please check your username and password.'
        render :action => "new"
      end
    end
    @user = User.new
  end


  def destroy
    user = User.find_by_id(session[:userid])
    if user
      update_authentication_token(user, nil)
      user.save
      reset_session
      flash[:notice] = "You have been signed out."
    end
    redirect_to(login_path)
  end

  private

  def verify_user(username_or_email)
    password = params[:password]
    if username_or_email.rindex('@')
      email=username_or_email
      user = User.authenticate_by_email(email, password)
    else
      username=username_or_email
      user = User.authenticate_by_username(username, password)
    end
    user
  end

  def update_authentication_token(user, remember_me)
    if remember_me == 1
      # create an authentication token if the user has clicked on remember me
      auth_token = SecureRandom.urlsafe_base64
      user.authentication_token = auth_token
      cookies.permanent[:auth_token] = auth_token
    else              # nil or 0
      # if not, clear the token, as the user doesn't want to be remembered.
      user.authentication_token = nil
      cookies.permanent[:auth_token] = nil
    end
  end

end
