class AnalysesController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:job_id])
    @analysis = Analysis.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:job_id])
    @analysis = Analysis.new(analysis_params)
    if @analysis.save
      render :show
      binding.pry
    else
      render :new
    end
  end

  def show
    @analysis = Analysis.find(params[:id])
  end

  private
    def analysis_params
      params.require(:analysis).permit(:text)
    end
end
