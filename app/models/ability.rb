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
  end
end
