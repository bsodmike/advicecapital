class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # Abilities
    # :manage
    # :create
    # :read
    # :update
    # :destroy

    # :manage, :all
    # :manage, Model
    #alias_action :index, :show, :to => :read
    #alias_action :new, :to => :create
    #alias_action :edit, :to => :update
    #alias_action :update, :destroy, :to => :modify

    if user.super_admin?
      can :manage, :all
      
		elsif user.admin?
			can :manage, Event
      can :manage, News
      can :manage, Video
      can :manage, Employee
      can :manage, Recipient
      can :read, AdvicePage
			can :view, :dashboard
      can [:read, :update], User, :id => user.id
      
    elsif user.investor?
      can :read, News
      can :read, User, :id => user.id
			can :read, Event
			can :read, Investor, :id => user.investor_id
			can :view, :tax_account
			#can :read, Investor, :id => Investor { |i| user.investors.where(investor_id: i.id).exists? }
			can :read, AdvicePage
      
    else # not logged in
      can :create, Recipient
      can :read, News
      can :read, Video
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
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
