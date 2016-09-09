class JobsController < ApplicationController

  def index
    @jobs = Job.order(priority: :desc, closing_date: :asc)
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      redirect_to company_path(@job.company)
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    render :edit
  end

  def update
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
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
    def job_params
      params.require(:job).permit(:title, :post_link, :closing_date, :posting_date, :priority)
    end

end
