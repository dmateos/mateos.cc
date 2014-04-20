class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    user ||= User.new
    @user = user
    @post = post
  end

  def index
    true
  end

  def show
    true
  end

  def create?
    user.admin?
  end

  def new?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
