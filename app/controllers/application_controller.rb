class ApplicationController < ActionController::Base
    before_action :current_user 

 
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authenticate_user
        if @current_user == nil
            redirect_to login_path
        end
    end
end
