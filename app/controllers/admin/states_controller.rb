class Admin::StatesController < Admin::ApplicationController
	before_filter :find_country
	before_filter :find_state, :only => [:edit, :show, :update]
	
	add_breadcrumb "Countries", :admin_countries_path

	def find_country
		@country = Country.find(params[:country_id])
	end

	def find_state
		@state = @country.states.find(params[:id])
	end
	
	def index
		add_breadcrumb @country.name, admin_country_path(@country)
		add_breadcrumb "States", admin_country_states_path(@country)

		@states = @country.states.page(params[:page])
	end
	
	def create
		add_breadcrumb @country.name, admin_country_path(@country)
		add_breadcrumb "States", admin_country_states_path(@country)
		add_breadcrumb "New", new_admin_country_state_path(@country)

		@state = @country.states.build(params[:state])
		if @state.save then
			flash[:success] = "State has been created."
			redirect_to admin_country_path(@country)
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @country.name, admin_country_path(@country)
		add_breadcrumb "States", admin_country_states_path(@country)
		add_breadcrumb @state.name, admin_country_state_path(@country, @state)
		add_breadcrumb "Edit", edit_admin_country_state_path(@country, @state)

		@state = @country.states.find(params[:id])
	end
	
	def new
		add_breadcrumb @country.name, admin_country_path(@country)
		add_breadcrumb "States", admin_country_states_path(@country)
		add_breadcrumb "New", new_admin_country_state_path(@country)
		
		@state = @country.states.build
	end
	
	def show
		add_breadcrumb @country.name, admin_country_path(@country)
		add_breadcrumb "States", admin_country_states_path(@country)
		add_breadcrumb @state.name, admin_country_state_path(@country, @state)

		@state = @country.states.find(params[:id])
	end
	
	def update
		add_breadcrumb @country.name, admin_country_path(@country)
		add_breadcrumb "States", :admin_countries_states_path
		add_breadcrumb @country.name, admin_country_path(@country)

		@state = @country.states.find(params[:id])
		if @state.update_attributes(params[:state]) then
			flash[:success] = "State has been updated."
			redirect_to admin_country_path(@country)
		else
			render "edit"
		end
	end
end
