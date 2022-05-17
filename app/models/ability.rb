# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user = user || User.new

    can :read, News
    can :manage, News, user: user if user.role == "reader"
    can :manage, News if user.role == "admin"
  end
end
