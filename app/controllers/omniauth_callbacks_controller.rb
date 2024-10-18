class OmniauthCallbacksController < ApplicationController
  def twitter
    # Current.user.twitter_accounts.create(
    twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
    twitter_account.update(
      name: auth.info.name,
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret
    )
    redirect_to twitter_accounts_path, notice: "successfully connect your twitter"
  end

  def auth
    request.env["omniauth.auth"]
  end
end

# # class OmniauthCallbacksController < ApplicationController
# #   def twitter
# #     # Log the current user information
# #     Rails.logger.info "Current User: #{Current.user.inspect}"

# # Attempt to find or initialize the Twitter account
# #     twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize

# #     # Log the account being created or updated
# #     Rails.logger.info "Attempting to create or update Twitter account: #{twitter_account.inspect}"

# #     if twitter_account.update(
# #       name: auth.info.name,
# #       username: auth.info.nickname,
# #       image: auth.info.image,
# #       token: auth.credentials.token, # Corrected from 'tokrn' to 'token'
# #       secret: auth.credentials.secret
# #     )
# #       # Log success
# #       Rails.logger.info "Successfully created/updated Twitter account: #{twitter_account.inspect}"
# #       redirect_to root_path, notice: "Successfully connected your Twitter account."
# #     else
# #       # Log errors if the update fails
# #       Rails.logger.error "Error saving Twitter account: #{twitter_account.errors.full_messages.join(", ")}"
# #       redirect_to root_path, alert: "Failed to connect your Twitter account."
# #     end
# #   end

# #   def auth
# #     request.env["omniauth.auth"]
# #   end
# # end

# # class OmniauthCallbacksController < ApplicationController
# #   def twitter
# #     twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize

# #     # Log the account before attempting to save
# #     Rails.logger.info "Attempting to create or update Twitter account: #{twitter_account.inspect}"

# #     if twitter_account.new_record?
# #       # This is a new record; save it
# #       if twitter_account.save
# #         Rails.logger.info "Successfully created Twitter account: #{twitter_account.inspect}"
# #         redirect_to root_path, notice: "Successfully connected your Twitter account."
# #       else
# #         Rails.logger.error "Error saving Twitter account: #{twitter_account.errors.full_messages.join(", ")}"
# #         redirect_to root_path, alert: "Failed to connect your Twitter account: #{twitter_account.errors.full_messages.join(", ")}"
# #       end
# #     else
# #       # If the record already exists, you can choose to update it or notify the user
# #       Rails.logger.info "Twitter account already exists for username: #{twitter_account.username}"
# #       redirect_to root_path, alert: "Your Twitter account is already connected."
# #     end
# #   end

# #   def auth
# #     request.env["omniauth.auth"]
# #   end
# # end

# class OmniauthCallbacksController < ApplicationController
#   def twitter
#     twitter_account = Current.user.twitter_accounts.find_or_initialize_by(username: auth.info.nickname)

#     Rails.logger.info "Attempting to create or update Twitter account: #{twitter_account.inspect}"

#     # Set attributes from the auth hash
#     twitter_account.assign_attributes(
#       name: auth.info.name,
#       image: auth.info.image,
#       token: auth.credentials.token,  # Correctly reference the token
#       secret: auth.credentials.secret
#     )

#     if twitter_account.save
#       Rails.logger.info "Successfully connected Twitter account: #{twitter_account.inspect}"
#       redirect_to root_path, notice: "Successfully connected your Twitter account."
#     else
#       Rails.logger.error "Error saving Twitter account: #{twitter_account.errors.full_messages.join(", ")}"
#       redirect_to root_path, alert: "Failed to connect your Twitter account: #{twitter_account.errors.full_messages.join(", ")}"
#     end
#   end

#   def auth
#     request.env["omniauth.auth"]
#   end
# end
