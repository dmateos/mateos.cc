class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post::order('created_at desc')
  end

  def show
    @post = Post.find(params[:id])
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, 
                                       :autolink => true, 
                                       :space_after_headers => true)

    @post.text = markdown.render(@post.text)
  end

  def new 
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.text = params[:post][:text]
    @post.save
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

end
