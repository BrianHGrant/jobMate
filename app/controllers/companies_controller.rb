class CompaniesController < ApplicationController
  before_action :authenticate_user!, except: :index

  helper ApplicationHelper

  def index
    if user_signed_in?
      @companies = current_user.companies.order(name: :asc, created_at: :desc).page(params[:page]).per(10)
    else
      @companies = Company.limit(5).order('RANDOM()').page(params[:page]).per(10)
    end
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
      flash[:notice] = 'Company successfully added!'
      binding.pry
      if params[:add_status] == "true"
        redirect_to new_company_status_path(@company)
      else
        redirect_to company_path(@company)
      end
    else
      render :new
    end
  end

  def edit
    @company = current_user.companies.find(params[:id])
    @update = params[:update]
  end

  def update
    @company = current_user.companies.find(params[:id])
    @company.user = current_user
    if @company.update(company_params)
      flash[:notice] = 'Edit Successful!'
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
    params.require(:company).permit(:name, :address, :city, :region, :category, :user_id, :domain)
  end
end
