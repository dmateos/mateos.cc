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
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def upate?
    @user and @user.admin?
  end

  def destroy?
    @user and @user.admin?
  end
end
