class ApplicationsController < ApplicationController

    def new 
        @application = Application.new
    end 

    def create  
        @application = Application.new(application_params)

        if @application.save
            current_user.applications << @application 
    
            redirect_to applications_path
        else 
            render :new 
        end 
    end 

    def edit 

    end 

    def update 

    end 

    def destroy 

    end 

    def index 
        @applications = Application.all
    end 

    def show 

    end 

    private 

    def application_params
        params.require(:application).permit(:company, :job_title, :job_location, :job_salary, :job_url, :description)
    end 


end 