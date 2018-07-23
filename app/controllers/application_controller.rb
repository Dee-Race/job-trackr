class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def home 

    end

    def about 

    end 

    def logged_in? 
        !!current_user
    end 

    private

    def current_user 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 


 
end
