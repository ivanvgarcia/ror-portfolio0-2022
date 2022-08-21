# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, draft: false

    can :manage, :all if user&.role == "admin"
  end
end
