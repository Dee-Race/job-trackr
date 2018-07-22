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
        @application = Application.find(params[:id])
    end 

    def update 
        application = Application.find(params[:id])
        if application.update(application_params)
            redirect_to application_path(application)
        end
    end 

    def destroy 
        Application.find(params[:id]).destroy
        redirect_to application_url
    end 

    def index 
        @applications = Application.all
    end 

    def show 
        @question = Question.new 
    end 

    private 

    def application_params
        params.require(:application).permit(:company, :job_title, :job_location, :job_salary, :job_url, :description, :date_applied)
    end 


end 