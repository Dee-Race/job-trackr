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

    def edit 

    end 

    def update 

    end 

    def destroy 

    end 

    def index 
        
    end 

    def show 

    end 

    private 

    def set_user
        @user = user.find(params[:id])
    end 

    def user_params
        params.require(:user).permit(:name, :password_digest, :email)
    end 


end 