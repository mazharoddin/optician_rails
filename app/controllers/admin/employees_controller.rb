class Admin::EmployeesController < Admin::ApplicationController
	add_breadcrumb "Employees", :admin_employees_path

	before_filter :find_employee, :only => [:edit, :show, :update]
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_employees_path
			@employees = @current_account.employees.where('first_name like ? or last_name like ? or email like ?', '%' + params[:q] + '%', '%' + params[:q] + '%', '%' + params[:q] + '%').order(:last_name).order(:first_name).page(params[:page])
		else
			@employees = @current_account.employees.order(:last_name).order(:first_name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_employee_path

		@employee = @current_account.employees.build(params[:employee])
		if @employee.save then
			flash[:success] = "Employee has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_admin_employee_path(@employee)
	end
	
	def new
		add_breadcrumb "New", new_admin_employee_path

		@employee = @current_account.employees.build
		@employee.active = true
	end
	
	def show
	end
	
	def update
		if params[:employee][:password].blank?
			params[:employee].delete(:password)
			params[:employee].delete(:password_confirmation)
		end
		if @employee.update_attributes(params[:employee]) then
			flash[:success] = "Employee has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_employee
		@employee = @current_account.employees.find(params[:id])
		add_breadcrumb @employee.full_name, admin_employee_path(@employee)
	end
end
