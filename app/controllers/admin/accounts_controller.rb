class Admin::AccountsController < Admin::ApplicationController
	add_breadcrumb "Accounts", :admin_accounts_path

	before_filter :find_account, :only => [:edit, :show, :update]
	authorize_resource	
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_accounts_path
			@accounts = Account.where('name like ? or subdomain like ?', '%' + params[:q] + '%', '%' + params[:q] + '%').order(:name).order(:subdomain).page(params[:page])
		else
			@accounts = Account.order(:name).order(:subdomain).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", :new_admin_account_path

		@account = Account.new(params[:account])
		if @account.save then
			flash[:success] = "Account has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_admin_account_path(@current_account, @account)
	end
	
	def new
		add_breadcrumb "New", :new_admin_account_path

		@account = Account.new
		@account.active = true
	end
	
	def show
	end
	
	def update
		if @account.update_attributes(params[:account]) then
			flash[:success] = "Account has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_account
		@account = Account.find(params[:id])
		add_breadcrumb @account.name, admin_account_path(@current_account, @account)
	end
end
