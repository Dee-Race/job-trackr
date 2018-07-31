class JobTitlesController < ApplicationController 

    def new 
        @job_title = JobTitle.new(job_title_params)
    end 

    def show 
        @job_title = JobTitle.most_popular
        @job_title = JobTitle.find(params[:id])
    end 

    def edit 
        @job_title = JobTitle.find(params[:id])
    end 

    def index 
        if logged_in?
         @job_titles = current_user.job_titles 
        end
    end 


    private 

    def job_title_params
        params.require(:job_title).permit(:title)
    end 


end 