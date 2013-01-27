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

	if user != nil
		if user.super_administrator
			can :manage, Account
			can :manage, Brand
			can :manage, Company
			can :manage, Country
			can :manage, Dispensing
			can :manage, Employee
			can :manage, EmploymentType
			can :manage, Gender
			can :manage, GuardianRelationship
			can :manage, Inventory
			can :manage, Invoice
			can :manage, LensCoating
			can :manage, LensMaterial
			can :manage, LensType
			can :manage, Optometrist
			can :manage, Patient
			can :manage, PersonalTitle
			can :manage, Prescription
			can :manage, State
			can :manage, Store
			can :manage, Tax
			can :manage, User
		else
			if user.administrator
				can :manage, Brand, :account_id => user.account_id
				can :manage, Company, :account_id => user.account_id
				can :manage, Employee, :account_id => user.account_id
				can :manage, Store, :account_id => user.account_id
				can :manage, Tax, :account_id => user.account_id
				can :manage, User, :account_id => user.account_id
				can :manage, Inventory, :account_id => user.account_id
			else
				can :read, Inventory, :account_id => user.account_id
			end
			if user.administrator || user.dispensing_optician
				can :manage, Dispensing, :account_id => user.account_id
				can :manage, Optometrist, :account_id => user.account_id
				can :manage, Prescription, :account_id => user.account_id
			else
				can :read, Dispensing, :account_id => user.account_id
				can :read, Optometrist, :account_id => user.account_id
				can :read, Prescription, :account_id => user.account_id
			end
			can :manage, Invoice, :account_id => user.account_id
			can :manage, Patient, :account_id => user.account_id
		end
	end
  end
end
