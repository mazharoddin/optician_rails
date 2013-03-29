class Admin::LocationsController < Admin::ApplicationController
	add_breadcrumb "Locations", :admin_locations_path

	before_filter :find_location, :only => [:edit, :show, :update]
	authorize_resource	
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_locations_path
			@locations = @current_account.locations.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@locations = @current_account.locations.order(:name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", :new_admin_location_path

		@location = @current_account.locations.build(params[:location])
		if @location.save then
			flash[:success] = "Location has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_admin_location_path(@current_account, @location)
	end
	
	def new
		add_breadcrumb "New", :new_admin_location_path

		@location = @current_account.locations.build(
			:monday_open => "09:00",
			:monday_close => "18:00",
			:tuesday_open => "09:00",
			:tuesday_close => "18:00",
			:wednesday_open => "09:00",
			:wednesday_close => "18:00",
			:thursday_open => "09:00",
			:thursday_close => "18:00",
			:friday_open => "09:00",
			:friday_close => "18:00",
			:saturday_open => "09:00",
			:saturday_close => "18:00",
			:sunday_open => "09:00",
			:sunday_close => "18:00"
			)
	end
	
	def show
	end
	
	def update
		if @location.update_attributes(params[:location]) then
			flash[:success] = "Location has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_location
		@location = @current_account.locations.find(params[:id])
		add_breadcrumb @location.name, admin_location_path(@current_account, @location)
	end
end
