class PasswordsController < ApplicationController
  # it will check that before run this action user must be logged in
  before_action :require_user_logged_in!

  def edit
  end

  # to update the password
  def update
    if Current.user.update(password_params)
      redirect_to root_path, notice: "Password Updated"
    else
      render :edit
    end
  end

  private
  # this helper method will only allow these field for entry
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
