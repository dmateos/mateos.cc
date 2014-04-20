class PostsController < ApplicationController
  after_action :verify_authorized, :except => :index

  def index
    @posts = Post::order('created_at desc')
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, 
                                       :autolink => true, 
                                       :space_after_headers => true)

    @post.text = markdown.render(@post.text)
  end

  def new 
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new
    authorize @post

    @post.title = params[:post][:title]
    @post.text = params[:post][:text]
    @post.save
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    @post.title = params[:post][:title]
    @post.text = params[:post][:text]
    @post.save
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to posts_path
  end

end
