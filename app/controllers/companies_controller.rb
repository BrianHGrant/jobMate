class CompaniesController < ApplicationController

  def index
    @jobs = Job.order(priority: :desc, closing_date: :asc)
    @contacts = Contact.all
    @companies = Company.order(name: :asc, created_at: :desc)
    @quotes = Quote.limit(5).order("RANDOM()")
  end

  def show
    @company = Company.find(params[:id])
    @jobs = Company.find(params[:id]).jobs.order(priority: :desc, closing_date: :asc)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "Company successfully added!"
      redirect_to companies_path
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company= Company.find(params[:id])
    if @company.update(company_params)
      flash[:notice] = "Edit Successful!"
      redirect_to companies_path
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end

  private
  def company_params
    params.require(:company).permit(:name, :address, :category)
  end

end
