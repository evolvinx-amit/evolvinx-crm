class LeadsController < ApplicationController
  before_filter :check_if_login

  def new
    @lead = Lead.new
  end

  def index
    @leads = Lead.find(:all, :conditions => [ "status = ?", "Open" ])
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
    begin
      @lead = Lead.find(params[:id])
      @find = Account.where("account_name = ?", @lead.company)
      if @find.empty?
        @account = Account.new
        @account.account_name = @lead.company
        @account.status = 1
        @account.phone = @lead.phone
        @account.website = @lead.website
        @account.annual_revenue = @lead.annual_revenue
        @account.employees = @lead.employee_no
        @account.description = @lead.description
        @account.b_street = @lead.street
        @account.b_city = @lead.city
        @account.b_state = @lead.state
        @account.b_zip = @lead.zip
        @account.b_country = @lead.country
        @account.owner = @lead.owner
        if @account.save
          @accountId = @account.id
        else
          flash[:error] = @account.errors.full_messages.to_sentence
        end
      else
        @find = Account.where("account_name = ?", @lead.company).first
        @accountId = @find.id
      end
      @contact = Contact.new
      @contact.firstname = @lead.firstname
      @contact.lastname = @lead.lastname
      @contact.title = @lead.title
      @contact.status = 1
      @contact.account_name = @accountId
      @contact.phone = @lead.phone
      @contact.email = @lead.email
      @contact.m_street = @lead.street
      @contact.m_city = @lead.city
      @contact.m_state = @lead.state
      @contact.m_zip = @lead.zip
      @contact.m_country = @lead.country
      @contact.owner = @lead.owner

      if @contact.save
        @lead.update_attribute(:status, "Qualified")
        flash[:notice] = "Lead converted successfully!"
      else
        flash[:error] = @contact.errors.full_messages.to_sentence
      end
      respond_to do |format|
        format.html { redirect_to(leads_path) }
      end
    rescue =>e
      respond_to do |format|
        flash[:error] = e.message
        format.html { redirect_to(leads_path) }
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
