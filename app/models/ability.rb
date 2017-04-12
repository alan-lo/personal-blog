class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    user ||= User.new # guest user (not logged in)
    if user.is_admin?
      can :manage, :all
    end

    #this defines an ability that declares that the user can 'manage' meaning
    #do any action (edit, update, destroy, read...etc)
    #Question class if 'q.user == user' meaning if the owner of the question
    #is the currently signed in user
    can :manage, Post do |p|
      #you should put an expression here that returns true / false. It should
      # return true when the user should be able to do the operation, which is
      # 'manage' in this case
      p.user == user
    end

    can :manage, Comment do |c|
      #you should put an expression here that returns true / false. It should
      # return true when the user should be able to do the operation, which is
      # 'manage' in this case
      c.user == user
    end

    # cannot only defines the ability for the cannot?() method
    # user cannot like its own post
    cannot :like, Post do |p|
      user == p.user
    end

    # can only defines the ability for the can() method
    # user can like other user posts
    can :like, Post do |p|
      user  !=p.user
    end

  end
end
