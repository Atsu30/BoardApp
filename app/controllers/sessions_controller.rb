class SessionsController < ApplicationController
  def new
  end

  def create

    user=  User.find_by(email: session_params[:email])
  
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to new_post_path
    else
      render :new
    end
  end
    
  private
    def session_params
      params.require(:session).permit(:email, :password, :password_confirmation)
    end
end
