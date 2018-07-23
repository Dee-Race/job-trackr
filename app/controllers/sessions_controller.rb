class SessionsController < ApplicationController 

    def new 
        @user = User.new
    end 

    def create 
        if request.env['omniauth.auth']
            @user = User.find_or_create_by(email: request.env['omniauth.auth']["info"]["email"])

            if @user 
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            end 
        else 
            @user = User.find_by(email: params[:user][:email])

            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            else 
                flash[:message] = 'Invalid email/password combination'
                render :new 
            end
        end
    end 

    def logout 
        session[:user_id] = nil
        redirect_to root_url
    end 

end 