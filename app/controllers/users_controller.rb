class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    
    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save
            sessions[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            render :new 
        end 
    end 


    def show 
        if logged_in?
            @user = User.find_by(id: params[:id])
            @application = Application.new 
            @question = Question.new 
            render :show 
        else 
            redirect_to root_path 
        end 
    end 

    private 

    def set_user
        @user = User.find(params[:id])
    end 

    def user_params
        params.require(:user).permit(:name, :password_digest, :email)
    end 


end 