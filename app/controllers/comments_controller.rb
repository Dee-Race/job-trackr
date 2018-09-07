class CommentsController < ApplicationController 

    def index 
        set_application
        @comments = @application.comments
        respond_to do |format|
            format.html { render :index, :layout => false }
            format.json { render json: @comments, :layout => false }
        end 
    end 

    def create 
        set_application
        @comment = @application.comments.build(comment_params) 
        if @comment.save 
            render 'comments/show', :layout => false 
        else 
            render "applications/show"
        end 
    end 

    private 

    def set_application 
        @application = Application.find(params[:application_id])
    end 

    def comment_params
        params.require(:comment).permit(:content)
    end 


end 