class Admin::EmployeesController < ApplicationController
	def index
		@employees = Employee.page(params[:page])
	end
	
	def create
		@employee = Employee.new(params[:employee])
		if @employee.save then
			flash[:success] = "Employee has been created."
			redirect_to :action => 'index'
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
			flash[:success] = "Employee has been updated."
			redirect_to :action => 'index'
		else
			redirect_to :action => 'index'
		end
	end
end
