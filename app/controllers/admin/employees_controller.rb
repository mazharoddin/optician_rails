class Admin::EmployeesController < Admin::ApplicationController
	add_breadcrumb "Employees", :admin_employees_path

	def index
		@page_title = "Employees"
		@employees = Employee.page(params[:page])
	end
	
	def create
		@page_title = "Create Employee"
		@employee = Employee.new(params[:employee])
		if @employee.save then
			flash[:success] = "Employee has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		@page_title = "Edit Employee"
		@employee = Employee.find(params[:id])
	end
	
	def new
		@page_title = "New Employee"
		@employee = Employee.new
	end
	
	def show
		@page_title = "Show Employee"
		@employee = Employee.find(params[:id])
		render "edit"
	end
	
	def update
		@page_title = "Update Employee"
		@employee = Employee.find(params[:id])
		if @employee.update_attributes(params[:employee]) then
			flash[:success] = "Employee has been updated."
			redirect_to :action => 'index'
		else
			redirect_to :action => 'index'
		end
	end
end
