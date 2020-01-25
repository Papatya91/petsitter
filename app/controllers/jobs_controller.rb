class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def create
    @job = Job.find(job_params)
    if @job.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
  end

  def show
    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:date, :location, :number_of_dogs)
  end
end