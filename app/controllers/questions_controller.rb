class QuestionsController < ApplicationController 

    def new 
        @question = Question.create(user_id: params[:user_id], application_id: params[:application_id])
    end 

end 