class PasswordResetsController < ApplicationController
  # this method will handle the forgot password request
  def new
  end

  # handle the post request and takes email to proceed with password change
  def create
    @user = User.find_by(email: params[:email]) # find the user based on the email id
    if @user.present?
      # send the mail to the user with link to change the password
      PasswordMailer.with(user: @user).reset.deliver_now
      redirect_to root_path, notice: "You have received a link in your registered mail."
    end
  end

  # after clicking the link this methos will handle that request
  def edit
    # find the user associated with token passed on the link
    @user = User.find_signed(params[:token], purpose: "password_reset")
    # catch the error if the token is inavlid
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "Your token has expired!"
  end

  # it will update the new password
  def update
    # find the user associated with token passed on the link
    @user = User.find_signed(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path, notice: "Your password was successfully reset."
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
