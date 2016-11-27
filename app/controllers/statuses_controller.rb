class StatusesController < ApplicationController
  before_action :authenticate_user!

  def new
    @company = Company.find(params[:company_id])
    @contacts = Contact.all
    @status = @company.statuses.new
  end

  def create
    @company = Company.find(params[:company_id])
    @contacts = Contact.all
    @status = @company.statuses.new(status_params)
    @status.user = current_user
    if contact_params[:last_name] != ''
      @contact = @company.contacts.new(contact_params)
      @contact.user = current_user
      @contact.save
      @status.contact_id = @contact.id
    end
    if @status.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

private

  def status_params
    params.require(:status).permit(:contact_type, :applied, :applied_date, :interview, :offer, :notes, :contact_id)
  end

  def contact_params
    params.permit(:last_name, :first_name, :phone, :email, :relationship, :position, :linkedIn)
  end
end
