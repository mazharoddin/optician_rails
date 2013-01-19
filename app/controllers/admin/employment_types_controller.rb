class Admin::EmploymentTypesController < Admin::ApplicationController
	before_filter :find_employment_type, :only => [:edit, :show, :update]
	
	add_breadcrumb "Employment Types", :admin_employment_types_path

	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_employment_types_path
			@employment_types = @current_account.employment_types.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@employment_types = @current_account.employment_types.order(:name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_employment_type_path

		@employment_type = @current_account.employment_types.build(params[:employment_type])
		if @employment_type.save then
			flash[:success] = "Employment type has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @employment_type.name, admin_employment_type_path(@employment_type)
		add_breadcrumb "Edit", edit_admin_employment_type_path(@employment_type)
	end
	
	def new
		add_breadcrumb "New", new_admin_employment_type_path

		@employment_type = @current_account.employment_types.build
	end
	
	def show
		add_breadcrumb @employment_type.name, admin_employment_type_path(@employment_type)
	end
	
	def update
		add_breadcrumb @employment_type.name, admin_employment_type_path(@employment_type)

		if @employment_type.update_attributes(params[:employment_type]) then
			flash[:success] = "Employment type has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_employment_type
		@employment_type = @current_account.employment_types.find(params[:id])
	end
end
