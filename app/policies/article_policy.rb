class ArticlePolicy
  attr_reader :user, :article

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      return scope.where(published: true) if @user.nil?

      if @user.admin?
        scope.all
      else
        scope.where(published: true)
      end

    end
  end

  def initialize(user, article)
    @user = user
    @article = article
  end

  def index?
  
  end

  def show?
    @article.published? or (@user.admin? if @user)
  end

  def new?
    create?
  end

  def create?
    @user and @user.admin?
  end

  def edit?
    update?
  end

  def update?
    @user and @user.admin?
  end

  def destroy?
    @user and @user.admin?
  end
end
