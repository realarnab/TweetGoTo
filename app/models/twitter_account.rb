# class TwitterAccount < ApplicationRecord
#   belongs_to :user
#   has_many :tweets
#   validates :username, uniqueness: true

#   def client
#     Twitter::REST::Client.new do |config|
#       config.consumer_key         = Rails.application.credentials.dig(:twitter, :api_key)
#       config.consumer_secret      = Rails.application.credentials.dig(:twitter, :api_secret)
#       config.access_token         = token
#       config.access_token_secret  = secret
#     end
#   end
# end

class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets
  validates :username, uniqueness: true

  def client
    X::Client.new(
      api_key:             Rails.application.credentials.dig(:twitter, :api_key),
      api_key_secret:      Rails.application.credentials.dig(:twitter, :api_secret),
      access_token:        token,
      access_token_secret: secret
    )
  end
end
