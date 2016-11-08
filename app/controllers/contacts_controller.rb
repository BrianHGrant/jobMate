class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contacts = current_user.contacts.order(last_name: :asc, first_name: :asc).page(params[:page]).per(10)
  end

  def show
    @contact = current_user.contacts.find(params[:id])
  end

  def new
    @companies = current_user.companies.all
    @contact = current_user.contacts.new
  end

  def create
    @jobs = current_user.jobs.all
    @contact = current_user.contacts.new(contact_params)
    @contact.user = current_user
    if @contact.save
      redirect_to contact_path(@contact)
    else
      @companies = current_user.companies.all
      render :new
    end
  end

  def edit
    @contact = current_user.contacts.find(params[:id])
    @companies = current_user.companies.all
    render :edit
  end

  def update
    @contact = current_user.contacts.find(params[:id])
    @contact.user = current_user
    if @contact.update(contact_params)
      redirect_to
      contact_path(@contact)
    else
      @companies = current_user.companies.all
      render :edit
    end
  end

  def destroy
    @contact = current_user.contacts.find(params[:id])
    @jobs = current_user.jobs.order(priority: :desc, closing_date: :asc)
    @contact.destroy
    redirect_to contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:last_name, :first_name, :phone, :email, :relationship, :position, :linkedIn, :company_id)
  end
end
