class RegistrationController  < ApplicationController
  skip_before_filter :set_current_account
  skip_before_filter :authenticate_user!
  
  add_breadcrumb 'Registration', :registration_path

  def new
    if current_user != nil
		redirect_to '/' + current_user.account.subdomain
	else
		@account = Account.new
		@employee = @account.employees.build
	end
  end

  def create
	@account = Account.new(params[:account])
	if @account.save
		redirect_to '/' + @account.subdomain
	else
		render 'new'
	end
  end
  
	private
	def navbar
	  @navbar_selected = 'dashboard'
	end
end
