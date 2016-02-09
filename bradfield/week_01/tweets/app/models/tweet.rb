class Tweet < ActiveRecord::Base
  # attr_accessible :title, :body

  def self.for_user(user_id)
    Tweet.where(user_id: user_id)
  end

  def parent
    Tweet.where(id: self.in_reply_to).first
  end

  def ancestors
    ancestors = []
    tweet = self.parent
    until tweet.nil?
      parent = tweet.parent
      ancestors.push(tweet)
      tweet = parent
    end
    ancestors
  end
end
