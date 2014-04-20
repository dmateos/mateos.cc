class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @post = post
  end

  def create?
    user.admin?
  end

  def new?
    user.admin?
  end
end
