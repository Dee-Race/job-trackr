class QuestionsController < ApplicationController 

    def create 
        @question = Question.new(question_params)
        @question.user = current_user 
        if @question.save
            redirect_to question_path(@question)
        else 
            @user = current_user
            @application = Application.new 
            render "users/show"
        end 
    end 

    def show 
        @question = Question.find(id: params[:id])
        @application = @question.application
    end 

    def edit 
        @application = Application.find(id: params[:id])
        @question = Question.find(id: params[:id])
    end 

    def update 
        @application = Application.find(id: params[:id])
        @question = Question.find(id: params[:id])
        @question.application = @application
        if @question.update(question_params)
            redirect_to application_question_path(@application, @question)
        else 
            render edit_application_question_path(@application, @question)
        end 
    end 


    private 

    def question_params 
        params.require(:question).permit(:user_id, :application_id, :content)
    end 

end 