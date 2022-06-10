# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Book
    can :create, Book
    can [:edit, :update, :destroy], Book, user: user
    if user.is_admin == true
      can :manage, Book
    end
  end
end
