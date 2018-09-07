class ApplicationsController < ApplicationController


    def new 
        @application = Application.new
        @application.build_job_title
    end 

    def create  
        @application = Application.create(application_params)
        @application.user_id = current_user.id 
        if @application.save
        #current_user.applications << @application  
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
        if application.update_attributes(application_params)
            redirect_to application_path(application)
        end
    end 

    def destroy 
        Application.find(params[:id]).destroy
        redirect_to applications_url
    end 

    def index 
        @applications = Application.all      #current_user.applications 
        respond_to do |format|
            format.html 
            format.json {render json: @applications}
        end 
    end 

    def show 
        @application = Application.find(params[:id])
        @comment = Comment.new
        respond_to do |format|
            format.html {render :show}
            format.json {render json: @application}
        end
    end 

    # Rails is using ApplicationSerializer when we call render json: application
    # ActiveModelSerializers don't require us to build out JSON string by hand

    private 


    def application_params
        params.require(:application).permit(:company, :job_location, :job_salary, :job_url, :description, :date_applied, :application_id, :job_title_id, job_titles_attributes:[:title])
    end 


end 