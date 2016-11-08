class JobsController < ApplicationController
  before_action :authenticate_user!
  helper ApplicationHelper
  helper_method :sort_column, :sort_direction
  def index
    @search = params[:search_string]
    @search_column = params[:search_column]
    if @search_column == 'company'
      @companies = Company.where('name ILIKE ?', '%#{@search}%')
      search = @companies.ids
    elsif @search_column == 'title'
      search = '%#{@search}%'
    elsif @search_column == 'priority'
      search = (@search.to_i..10).to_a
    end
    @jobs = current_user.jobs.search(@search_column, search).order(sort_column + ' ' + sort_direction).page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @company = current_user.companies.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
  end

  def new
    @company = Company.find(params[:company_id])
    @contacts = Contact.all
    @job = @company.jobs.new
  end

  def create
    @company = Company.find(params[:company_id])
    @contacts = Contact.all
    @job = @company.jobs.new(job_params)
    @job.user = current_user
    if @job.save
      render :show
    else
      render :new
    end
  end

  def edit
    @company = current_user.companies.find(params[:company_id])
    @contacts = current_user.contacts.all
    @job = @company.jobs.find(params[:id])
    @resume = params[:resume_up]
    @cover_letter = params[:cover_letter_up]
    @analyze = params[:analyze]
    render :edit
  end

  def update
    @company = Company.find(params[:company_id])
    @contacts = Contact.all
    @job = @company.jobs.find(params[:id])
    @job.user = current_user
    if @job.update(job_params)
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    @job.destroy
    redirect_to company_path(@job.company)
  end

  private

  def sort_column
    Job.column_names.include?(params[:sort]) ? params[:sort] : 'closing_date'
  end

  def sort_direction
    %w[ASC DESC].include?(params[:direction]) ? params[:direction] : 'ASC'
  end

  def job_params
    params.require(:job).permit(:title, :post_link, :closing_date, :posting_date, :priority, :contact_id, :resume, :cover_letter, :cover_letter_text)
  end
end
