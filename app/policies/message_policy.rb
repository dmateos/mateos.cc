class MessagePolicy
  attr_reader :user, :message

  def initialize(user, message)
    @user = user
    @message = message
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

  def update?
    @user and @user.admin?
  end

  def destroy?
    @user and @user.admin?
  end
end
