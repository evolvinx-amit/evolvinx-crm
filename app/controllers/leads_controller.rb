class LeadsController < ApplicationController
  before_filter :check_if_login

  def new
    @lead = Lead.new
  end

  def index
      @leads = Lead.find(:all)
      respond_to do |format|
        format.html
        format.js
      end
  end

  def create
    @lead = Lead.new(params[:lead])
    @lead[:owner] =  session[:userid]
    respond_to do |format|
      begin
        if @lead.save
          format.json { render :json => {"success" => true, "message" => "Successfully created!"} }
        else
          format.json { render :json => {"error" => true, "exception" => @lead.errors.full_messages.to_sentence} }
        end
      rescue =>e
        @error= e.message
        format.json { render :json => {"error" => true, "exception" => @error} }
      end
    end
  end

  def show
    @title = t "lead.t_view"
    @lead = Lead.find(params[:id])
  end

  def edit
    @title = t "lead.t_edit_lead"
    @lead = Lead.find(params[:id])
  end

  def update
    @title = t "user.t_update_lead"
    @lead = Lead.find(params[:id])
    respond_to do |format|
      if @lead.update_attributes(params[:lead])
        format.html { redirect_to(@lead, :notice => ("Successfully updated the lead!") ) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @lead.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @title = t "user.t_delete_lead"
    @lead = Lead.find(params[:id])
    @lead.destroy
    respond_to do |format|
      flash[:notice] = "lead deleted successfully!"
      format.html { redirect_to(leads_path) }
    end
  end

  def convert_lead
    @lead = Lead.find(params[:id])
    @contact = Contact.new
    @contact.email = "amit@gmail.com"
    @contact.lastname = "aaaa"
    @contact.owner = 1
    @contact.save
  end

  protected
  def check_if_login
    if session[:userrole].present?

    else
      redirect_to(login_path)
    end
  end
end
