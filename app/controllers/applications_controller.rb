class ApplicationsController < ApplicationController

    def new 
        @application = Application.new
        @application.build_job_title
    end 

    def create  
        @application = Application.create(application_params)
        render json: application, status: 201                # @application.user_id = current_user.id 
    end                                                      # if @application.save
                                                          # current_user.applications << @application 
    
                                                            # redirect_to applications_path
                                                        #  else 
                                                            # render :new 
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
        @comment = Comment.new(application: @application)
        respond_to do |format|
            format.html {render :show}
            format.json {render json: @application} 
        end
    end 

    def next 

    end 

    private 

    def application_params
        params.require(:application).permit(:company, :job_location, :job_salary, :job_url, :description, :date_applied, :application_id, :job_title_id, job_titles_attributes:[:title])
    end 


end 