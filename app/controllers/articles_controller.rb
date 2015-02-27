class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = policy_scope(Article)
  end

  def show
    authorize @article
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
    @article.body = markdown.render(@article.body)
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    authorize @article
    @article.save
    respond_to do |format|
      format.html { redirect_to @article }
      format.json { redirect_to @article }
    end
  end

  def edit
  end

  def update
    @article.update(article_params)
    @article.save
    respond_to do |format|
      format.html { redirect_to @article }
      format.json { redirect_to @article }
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_path }
      format.json { redirect_to articles_path }
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
    authorize @article
  end

  def article_params
    params.require(:article).permit(:title, :body, :published)
  end
end
