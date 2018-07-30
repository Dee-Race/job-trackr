class JobTitlesController < ApplicationController 

    def new 
        @job_title = JobTitle.new(job_title_params)
    end 

    def show 
        @job_title = JobTitle.find(id: params[:id])
    end 

    def edit 
        @job_title = JobTitle.find(id: params[:id])
    end 

    def index 
        @job_titles = JobTitle.all
    end 


    private 

    def job_title_params
        params.require(:job_title).permit(:title)
    end 


end 