class UserPolicy
  attr_reader :user, :policy

  def initialize(user, policy)
    @user = user
    @policy = policy
  end

  def index?
    @user and @user.admin?
  end

  def show?
    @user and @user.admin?
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    @user and @user.admin?
  end

  def upate?
    @user and @user.admin?
  end

  def destroy?
    @user and @user.admin?
  end
end
