class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "User was successfully logged in" 

    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end
  

  def destroy
    session.delete(:user_id)
    redirect_to login_path

  end
  
end
