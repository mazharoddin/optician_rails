class Ability
  include CanCan::Ability

  def initialize(user, account)
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

	can :home, :dashboard
	if account != nil
		can :read, :dashboard
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
			can :manage, Inventory, account.plan.inventory => true
			can :manage, Invoice
			can :manage, Item
			can :manage, LensCoating
			can :manage, LensMaterial
			can :manage, LensType
			can :manage, Optometrist
			can :manage, Patient
			can :manage, PersonalTitle
			can :manage, Plan
			can :manage, Prescription
			can :manage, State
			can :manage, Store
			can :manage, Tax
			can :manage, User
			can :read, :admin_dashboard
		else
			if user.administrator
				can :read, Account, :id => account.id
				can :manage, Brand, :account_id => account.id
				can :manage, Company, :account_id => account.id
				can :manage, Employee, :account_id => account.id
				can :manage, Store, :account_id => account.id
				can :manage, User, :account_id => account.id
				can :manage, Inventory, account.plan.inventory && :account_id => account.id
				can :read, :admin_dashboard
			else
				can :read, Brand, :account_id => account.id
				can :read, Inventory
				
				# Currently not checked
				can :read, Store, :account_id => account.id
			end
			if user.administrator || user.dispensing_optician
				can :manage, Dispensing, :account_id => account.id
				can :manage, Optometrist, :account_id => account.id
				can :manage, Prescription, :account_id => account.id
			else
				can :read, Dispensing, :account_id => account.id
				can :read, Optometrist, :account_id => account.id
				can :read, Prescription, :account_id => account.id
			end
			can :manage, Invoice, :account_id => account.id
			can :manage, Patient, :account_id => account.id

			# Currently not checked
			can :read, Country
			can :read, EmploymentType
			can :read, Gender
			can :read, GuardianRelationship
			can :read, LensCoating
			can :read, LensMaterial
			can :read, LensType
			can :read, PersonalTitle
			can :read, Plan
			can :read, State
		end
		cannot :void, Invoice, :read_only? => true
		cannot :update, Invoice, :read_only? => true
		cannot :set_patient, Invoice, :read_only? => true
		cannot :set_cash_sale, Invoice, :read_only? => true
	end
  end
end
