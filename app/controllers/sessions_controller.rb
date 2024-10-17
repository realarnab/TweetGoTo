class SessionsController < ApplicationController
  # destroy the current user session
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end

  def new
  end

  def create
    # find the user in the database based on the email id provided
    user = User.find_by(email: params[:email])
    # check wheather the user exist and the password matches
    if user.present? && user.authenticate(params[:password])
      # after successfully loged in it will create a session of that user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully!"
    else
      flash[:alert] = "Invalid credentials!!"
      render :new
    end
  end
end
