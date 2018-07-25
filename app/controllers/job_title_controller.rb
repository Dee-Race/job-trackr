class JobTitle < Application Controller 

    def new 
        @job_title = JobTitle.new(job_title_params)
    end 


    private 

    def job_title_params
        params.require(:job_title).permit(:title)
    end 


end 