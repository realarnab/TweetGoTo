class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # @user = User.new(params[:user])
    @user = User.new(user_params) # instead of write it directly, used helper method
    if @user.save
      session[:user_id] = @user.id # after creating the the user it will create session for that user
      redirect_to root_path, notice: "Successfully created account."
    else
      # flash[:alert] = "Something went wrong"
      flash.now[:alert] = "Could not create account. Please check the form for errors."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation) # this will allow only this fields
  end
end
