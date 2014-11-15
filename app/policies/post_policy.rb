class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    user.admin? if not user.nil?
  end

  def edit?
    update?
  end

  def update?
    user.admin? if not user.nil?
  end

  def destroy?
    user.admin? if not user.nil?
  end
end
