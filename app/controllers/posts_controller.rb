class PostsController < ApplicationController
  def index
    @posts = Post::all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new 
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, 
                                       :autolink => true, 
                                       :space_after_headers => true)
    md_text = markdown.render(params[:post][:text])

    @post.text = md_text
    @post.save
    redirect_to @post
  end

end
