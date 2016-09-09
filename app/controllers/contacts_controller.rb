class ContactsController < ApplicationController

  def show
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.find(params[:id])
  end

  def new
    @company = Company.find(params[:company_id])
    @jobs = Job.all
    @contact = @company.contacts.new
  end

  def create
    @company = Company.find(params[:company_id])
    @jobs = Job.all
    @contact = @company.contacts.new(contact_params)
    if @contact.save
      redirect_to company_path(@contact.company)
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.find(params[:id])
    render :edit
  end

  def update
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.find(params[:id])
    if @contact.update(contact_params)
      redirect_to company_path(@contact.company)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.find(params[:id])
    @contact.destroy
    redirect_to company_path(@contact.company)
  end

  private
    def contact_params
      params.require(:contact).permit(:last_name, :first_name, :phone, :email, :relationship, :position, :linkedIn)
    end

end
