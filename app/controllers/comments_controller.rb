class CommentsController < ApplicationController 
    before_action :set_application


    def index 
        @comments = @application.comments
        respond_to do |format|
            format.html { render :index, :layout => false }
            format.json { render json: @comments, :layout => false }
        end 
    end 

    def create 
        @comment = @application.comments.build(comment_params) 
        @comment.save 
        redirect_to application_path(@application)
    end 

    private 

    def comment_params
        params.require(:comment).permit(:content)
    end 

    def set_application 
        @application = Application.find(params[:application_id])
    end 



end 