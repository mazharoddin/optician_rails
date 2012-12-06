class Admin::CompaniesController < Admin::ApplicationController
	before_filter :find_company, :only => [:edit, :show, :update]
	
	add_breadcrumb "Companies", :admin_companies_path

	def index
		@companies = Company.order(:name).page(params[:page])
	end
	
	def create
		add_breadcrumb "New", new_admin_company_path

		@company = Company.new(params[:company])
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

		@company = Company.new
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
		@company = Company.find(params[:id])
	end
end
