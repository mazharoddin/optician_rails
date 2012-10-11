class Admin::EmployeesController < Admin::ApplicationController
	before_filter :find_employee, :only => [:edit, :show, :update]
	
	add_breadcrumb "Employees", :admin_employees_path

	def find_employee
		@employee = Employee.find(params[:id])
	end

	def index
		@employees = Employee.page(params[:page])
	end
	
	def create
		add_breadcrumb "New", new_admin_employee_path

		@employee = Employee.new(params[:employee])
		if @employee.save then
			flash[:success] = "Employee has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @employee.full_name, admin_employee_path(@employee)
		add_breadcrumb "Edit", edit_admin_employee_path(@employee)
	end
	
	def new
		add_breadcrumb "New", new_admin_employee_path

		@employee = Employee.new
	end
	
	def show
		add_breadcrumb @employee.full_name, admin_employee_path(@employee)
	end
	
	def update
		add_breadcrumb @employee.full_name, admin_employee_path(@employee)

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
end
