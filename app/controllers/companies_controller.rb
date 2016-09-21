class CompaniesController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    if user_signed_in?
      @jobs = current_user.jobs.order(priority: :desc, closing_date: :asc)
      @contacts = current_user.contacts.all
      @companies = current_user.companies.order(name: :asc, created_at: :desc)
    else
      @companies = Company.limit(5).order("RANDOM()")
    end
    @quotes = Quote.limit(5).order("RANDOM()")
  end

  def show
    @company = current_user.companies.find(params[:id])
    @jobs = current_user.companies.find(params[:id]).jobs.order(priority: :desc, closing_date: :asc)
  end

  def new
    @company = current_user.companies.new
  end

  def create
    @company = current_user.companies.new(company_params)
    @company.user = current_user
    if @company.save
      flash[:notice] = "Company successfully added!"
      redirect_to companies_path
    else
      render :new
    end
  end

  def edit
    @company = current_user.companies.find(params[:id])
  end

  def update
    @company= current_user.companies.find(params[:id])
    @company.user = current_user
    if @company.update(company_params)
      flash[:notice] = "Edit Successful!"
      redirect_to companies_path
    else
      render :edit
    end
  end

  def destroy
    @company = current_user.companies.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end

  private
  def company_params
    params.require(:company).permit(:name, :address, :category, :user_id)
  end

end
