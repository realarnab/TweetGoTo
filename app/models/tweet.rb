class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimun: 1, maximum: 280 }
  validates :publish_at, presence: true

  # this callbacks set a default value for publish_at if not set by user
  after_initialize do
    self.publish_at ||= 24.hours.from_now
  end

  # it will triggered after tweet is saved to the db / publish_at attribute change- it schedule a b/g job in TweetJob
  after_save_commit do
    if publish_at_previously_changed? # it will check the pulish_at is changed or not
      TweetJob.set(wait_until: publish_at).perform_later(self)
    end
  end

  # it returns true if the tweet_id is present means tweet is already published
  def published?
    tweet_id?
  end

  # it is responsible for publishing the tweet over X api
  def publish_to_twitter!
    tweet = twitter_account.client.update(body) # this send the tweet via X api
    update(tweet_id: tweet.id) # capture the tweet id
  end
end
