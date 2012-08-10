class Admin::EmployeesController < ApplicationController
	def index
		@employees = Employee.page(params[:page])
	end
	
	def create
		@employee = Employee.new(params[:employee])
		if @employee.save then
			flash[:notice] = "Employee has been created."
			redirect_to [:admin, @employee]
		else
			render "new"
		end
	end
	
	def edit
		@employee = Employee.find(params[:id])
	end
	
	def new
		@employee = Employee.new
	end
	
	def show
		@employee = Employee.find(params[:id])
		render "edit"
	end
	
	def update
		@employee = Employee.find(params[:id])
		if @employee.update_attributes(params[:employee]) then
			flash[:notice] = "Employee has been updated."
			redirect_to [:admin, @employee]
		else
			render "edit"
		end
	end
end
