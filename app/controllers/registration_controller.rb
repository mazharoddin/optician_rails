class RegistrationController  < ApplicationController
  skip_before_filter :set_current_account
  skip_before_filter :authenticate_user!
  
  add_breadcrumb 'Registration', :registration_path

  def new
	@account = Account.new
	@employee = @account.employees.build
  end

  def create
	@account = Account.new(params[:account])
	if @account.save
		redirect_to 'http://' + @account.subdomain + '.opticianplus.com'
	else
		render 'new'
	end
  end
  
	private
	def navbar
	  @navbar_selected = 'dashboard'
	end
end
