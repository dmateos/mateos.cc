class Feedcache < ActiveRecord::Base
  def self.update
    twitter_config = {
      :consumer_key    => "mq3I0RNkORaJeSngr3745A",
      :consumer_secret => "y9vwUm3KixUouuPhStitNZHD11fJUTC4kHrOT0A",
    }

    twitter_client = Twitter::Client.new(twitter_config)
    twitter_client.user('dmateos')
    tweets = twitter_client.user_timeline('dmateos', :count => 5)

    tweets.each do |tweet|
      cache_entry = Feedcache.new
      cache_entry.for = "twitter"
      cache_entry.title = "null"
      cache_entry.data = tweet.text
      cache_entry.save
    end

    github_feed = Feedzirra::Feed.fetch_and_parse("http://github.com/dmateos.atom")
    gitfeed = github_feed.entries

    gitfeed.each do |git|
      cache_entry = Feedcache.new
      cache_entry.for = "github"
      cache_entry.title = git.title
      cache_entry.data = "null"
      cache_entry.save
    end
  end
end
