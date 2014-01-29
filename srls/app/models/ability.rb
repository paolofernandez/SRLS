class Ability
  include CanCan::Ability

  def initialize(user)
    #if user_signed_in?
      user ||= User.new # guest user (not logged in)
      if user.rol == 1 #admin
           can :manage, :all
      else
        if user.rol == 2
          can :manage, BaptismItem
          can :manage, BaptismBook
          can :manage, ConfirmationItem
          can :manage, ConfirmationBook
          can :manage, DeathRecordItem
          can :manage, DeathRecordBook
          can :manage, MarriegeItem
          can :manage, MarriegeBook
          can [:index, :table_index, :not_valid_index, :show, :edit], Validator
        else
          if user.rol == 3
            can :manage, BaptismItem
            can :manage, BaptismBook
            can :manage, ConfirmationItem
            can :manage, ConfirmationBook
            can :manage, DeathRecordItem
            can :manage, DeathRecordBook
            can :manage, MarriegeItem
            can :manage, MarriegeBook
            can :manage, Validator
          end
        end
      end
  end
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
end