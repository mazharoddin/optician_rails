class Admin::CompaniesController < Admin::ApplicationController
	before_filter :find_company, :only => [:edit, :show, :update]
	
	add_breadcrumb "Companies", :admin_companies_path

	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_companies_path
			@companies = @current_account.companies.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@companies = @current_account.companies.order(:name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_company_path

		@company = @current_account.companies.build(params[:company])
		if @company.save then
			flash[:success] = "Company has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @company.name, admin_company_path(@company)
		add_breadcrumb "Edit", edit_admin_company_path(@company)
	end
	
	def new
		add_breadcrumb "New", new_admin_company_path

		@company = @current_account.companies.build
	end
	
	def show
		add_breadcrumb @company.name, admin_company_path(@company)
	end
	
	def update
		add_breadcrumb @company.name, admin_company_path(@company)

		if @company.update_attributes(params[:companu]) then
			flash[:success] = "Company has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_company
		@company = @current_account.companies.find(params[:id])
	end
end
