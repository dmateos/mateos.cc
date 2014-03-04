class PagesController < ApplicationController
  def index
    @posts = Post::find(:all, :order => 'updated_at desc', :limit => 3)
  end

  def about
  end

  def contact
  end

end
