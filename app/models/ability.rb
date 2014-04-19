class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, Post
      can :admin, :all
    end

    can :read, :all
  end
end
