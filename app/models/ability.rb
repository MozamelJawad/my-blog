# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, Post # anyone can read posts

    return unless user.present? # if the user is not logged in, stop here

    can :create, Post # if the user is logged in can create posts
    can :create, Comment # if the user is logged in can create comments
    can :read, User # if the user is logged in can read other users profiles

    can :destroy, Post, author_id: user.id # if the user is logged in can delete his own posts
    can :destroy, Comment, user_id: user.id # if the user is logged in can delete his own comments

    return unless user.role == 'admin' # if the user is not an admin, stop here
    can :manage, :all # if the user is an admin, can manage all

    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
