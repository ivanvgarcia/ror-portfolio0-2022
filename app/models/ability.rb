# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, Post, draft: false

    return unless user.present?

    can :manage, :all if user.admin?
  end
end
