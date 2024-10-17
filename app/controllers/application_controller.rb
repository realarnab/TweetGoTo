class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  # before any action is performed it will call set_current_user method
  before_action :set_current_user

  # so that Current user can be tracked by all the controller
  def set_current_user
    if session[:user_id]
      # fetched the user by id and set it in Current user
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  # ensure that user must be logged in to access certain parts of the app.
  def require_user_logged_in
    redirect_to sign_in_path, alret: "You must be signed in." if Current.user.nil?
  end
end
