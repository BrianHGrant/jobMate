class JobsController < ApplicationController
  before_action :authenticate_user!
  helper ApplicationHelper
  helper_method :sort_column, :sort_direction
  def index
    @search_string = params[:search_string]
    @search_column = params[:search_column]
    @search_ids = []
    if @search_column == 'company'
      @companies = Company.where("name ILIKE ?", "%#{@search_string}%")
      search_array = @companies.ids.map {|val| "#{val}"}
      search_array.map! { |s| s.to_i }
      @jobs = current_user.jobs.where("company_id IN (?)", search_array).order(sort_column + " " + sort_direction).page(params[:page]).per(10)
    elsif @search_column == 'title'
      @jobs = Job.where("title ILIKE ?", "%#{@search_string}%").order(sort_column + " " + sort_direction).page(params[:page]).per(10)
    elsif @search_column == 'priority'
      search_array = (@search_string.to_i..10).to_a.map {|val| "#{val}"}
      search_array.map! { |s| s.to_i }
      @jobs = Job.where("priority IN (?)", search_array).order(sort_column + " " + sort_direction).page(params[:page]).per(10)
    else
      @jobs = current_user.jobs.order(sort_column + " " + sort_direction).page(params[:page]).per(10)
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
      redirect_to company_path(@job.company)
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
    render :edit
  end

  def update
    @company = Company.find(params[:company_id])
    @contacts = Contact.all
    @job = @company.jobs.find(params[:id])
    @job.user = current_user
    if @job.update(job_params)
      redirect_to company_path(@job.company)
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
    Job.column_names.include?(params[:sort]) ? params[:sort] : "closing_date"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

    def job_params
      params.require(:job).permit(:title, :post_link, :closing_date, :posting_date, :priority, :contact_id, :resume, :cover_letter)
    end

end
