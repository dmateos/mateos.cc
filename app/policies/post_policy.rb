class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    user ||= User.new
    @user = user
    @post = post
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    user.admin?
  end

  def edit?
    update?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
