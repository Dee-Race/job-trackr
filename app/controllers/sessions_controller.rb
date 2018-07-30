class SessionsController < ApplicationController 

    def new 
        @user = User.new
    end 

    def create 
        if auth
            @user = User.find_or_create_by(email: auth["info"]["email"]) do |u|
                u.name = auth["info"]["name"]
                u.password = auth["uid"]
            end

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
                flash.now[:error] = 'Invalid email/password combination'
                render 'new'
            end
        end
    end 

    def destroy 
        session.clear
        @current_user = nil 
        redirect_to root_url
    end
    
    private 

    def auth 
        request.env['omniauth.auth']
    end

end 