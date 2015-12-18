class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in (current) user. For example:
    #
      # if user.is? :admin
      #   can :access, :all
      # elsif user.is? :manager
      #   can :access, :home
      #   can :create, [:topics, :posts]
      # elsif user.is? :user
      #   can :access, :home
      #   can :create, [:posts, :replies]
      # else
      #   can :read, :all
      # end
    if !user
      can :read, :all
    end
    # if user
    #   admin_rules if user.roles.include? :admin
    #   editor_rules if user.roles.include? :manager
    #   default_rules
    # end
    #
    # Here if there is a user he will be able to perform any action on any controller.
    # If someone is not logged in he can only access the home, users, and sessions controllers.
    #
    # The first argument to `can` is the action the user can perform. The second argument
    # is the controller name they can perform that action on. You can pass :access and :all
    # to represent any action and controller respectively. Passing an array to either of
    # these will grant permission on each item in the array.
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
  def admin_rules
    can :manage, :all
  end

  def manager_rules
    can :manage, [Topic, Post]
  end
end
