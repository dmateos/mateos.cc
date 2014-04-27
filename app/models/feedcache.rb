class Feedcache < ActiveRecord::Base
  def self.update
    Feedcache.delete_all

    twitter_config = {
      :consumer_key    => "mq3I0RNkORaJeSngr3745A",
      :consumer_secret => "y9vwUm3KixUouuPhStitNZHD11fJUTC4kHrOT0A",
    }

    twitter_client = Twitter::Client.new(twitter_config)
    twitter_client.user('dmateos')
    tweets = twitter_client.user_timeline('dmateos', :count => 5)


    tweets.each do |tweet|
      if Feedcache.where(data: tweet.text).empty?
        cache_entry = Feedcache.new
        cache_entry.for = "twitter"
        cache_entry.title = "null"
        cache_entry.data = tweet.text
        cache_entry.save
      end
    end

    github_feed = Feedzirra::Feed.fetch_and_parse("http://github.com/dmateos.atom")
    gitfeed = github_feed.entries

    gitfeed.each do |git|
      if c = Feedcache.where(title: git.title).first
        c.count += 1 
        c.save
      else
        cache_entry = Feedcache.new
        cache_entry.for = "github"
        cache_entry.title = git.title
        cache_entry.data = "null"
        cache_entry.count = 1
        cache_entry.save
      end
    end
  end
end
