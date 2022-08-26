# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    can :index, Post, Post.published

    can :show, Post

    return unless user.present?

    can :manage, :all if user.admin?
  end
end
