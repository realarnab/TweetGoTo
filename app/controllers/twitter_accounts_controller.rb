class TwitterAccountsController < ApplicationController
  before_action :require_user_logged_in!
  # before deleting the twitter account, user needs to connected with a twitter account
  before_action :set_twitter_account, only: [ :destroy ]

  def index
    # finds all the twitter account associated with the user from the twitter_accounts method
    @twitter_accounts = Current.user.twitter_accounts
  end

  def destroy
    # @twitter_account = Current.user.twitter_accounts.find(params[:id])
    @twitter_account.destroy
  redirect_to twitter_accounts_path, notice: "Successfully disconnected @#{@twitter_account.username}"
  end

  def set_twitter_account
    @twitter_account = Current.user.twitter_accounts.find(params[:id])
  end
end
