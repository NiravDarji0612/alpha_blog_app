class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # Credentials Checking before Session
    if user && user.authenticate(params[:session][:password])
      #adding user_id to the session object
      session[:user_id] = user.id
      flash[:notice] = 'you are successfully logged in'
      redirect_to user
    else
      flash.now[:alert] = 'Wrong username or password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are Logged out"
    redirect_to root_path
  end
end
