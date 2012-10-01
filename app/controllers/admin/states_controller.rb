class Admin::StatesController < Admin::ApplicationController
	before_filter :find_country
	
	add_breadcrumb "Countries", :admin_countries_path
	add_breadcrumb "Countries", :admin_countries_path(params[:country_id])
	add_breadcrumb "States", :admin_countries_states_path

	def find_country
		@page_title = "Find State"
		@country = Country.find(params[:country_id])
	end
	
	def index
		@page_title = "States"
		@states = @country.states.page(params[:page])
	end
	
	def create
		@page_title = "Create State"
		@state = @country.states.build(params[:state])
		if @state.save then
			flash[:success] = "State has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		@page_title = "Edit State"
		@state = @country.states.find(params[:id])
	end
	
	def new
		add_breadcrumb "New", :root_path
		@page_title = "New State"
		@state = @country.states.build
	end
	
	def show
		add_breadcrumb "New", :new_admin_country_path
		@page_title = "Show State"
		@state = @country.states.find(params[:id])
		render "edit"
	end
	
	def update
		@page_title = "Update State"
		@state = @country.states.find(params[:id])
		if @state.update_attributes(params[:state]) then
			flash[:success] = "State has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end
end
