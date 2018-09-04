class CommentsController < ApplicationController 

    def new 
        @comment = Comment.new 
    end 

    def create 
        @application = Application.find(params[:application_id])
        @comment = @application.comments.build(comment_params) 
        @comment.save
        redirect_to application_path(@application)
    end 

    private 

    def comment_params
        params.require(:comment).permit(:content)
    end 



end 