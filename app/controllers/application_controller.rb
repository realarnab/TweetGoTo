class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  # before any action is performed it will call set_current_user method
  before_action :set_current_user

  # so that current user can be tracked by all the controller
  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user_logged_in
    redirect_to sign_in_path, alret: "You must be signed in." if Current.user.nil?
  end
end
