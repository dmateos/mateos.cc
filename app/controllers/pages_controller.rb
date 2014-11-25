class PagesController < ApplicationController
  def index
    #Feedcache.update

    @posts = Post::order('updated_at desc').where(published: true).limit(3)
    @tweets = Feedcache.where(for: "twitter").order('updated_at desc').limit(3)
    @gitfeed = Feedcache.where(for: "github").order('updated_at').limit(3)
  end

  def admin

  end

  def test

  end
end
