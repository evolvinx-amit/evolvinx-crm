class UsersController < ApplicationController
  def new
    @user = User.new
    @roles = Role.find(:all)
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        flash[:notice] = "Successfully created the user"
        format.html { render :action => "new" }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end

  end
  
end
