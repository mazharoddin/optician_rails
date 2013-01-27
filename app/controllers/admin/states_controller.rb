class Admin::StatesController < Admin::ApplicationController
	add_breadcrumb "Countries", :admin_countries_path
	
	before_filter :find_country
	before_filter :find_state, :only => [:edit, :show, :update]
	authorize_resource	
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", admin_country_states_path(@country)
			@states = @country.states.where('name like ? or short_name like ?', '%' + params[:q] + '%', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@states = @country.states.order(:name).page(params[:page])
		end
	end
	
	def create
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
		add_breadcrumb "Edit", edit_admin_country_state_path(@country, @state)
	end
	
	def new
		add_breadcrumb "New", new_admin_country_state_path(@country)
		
		@state = @country.states.build
	end
	
	def show
	end
	
	def update
		if @state.update_attributes(params[:state]) then
			flash[:success] = "State has been updated."
			redirect_to admin_country_path(@country)
		else
			render "edit"
		end
	end

	private
	def find_country
		@country = Country.find(params[:country_id])
		add_breadcrumb @country.name, admin_country_path(@country)
		add_breadcrumb "States", admin_country_states_path(@country)
	end

	def find_state
		@state = @country.states.find(params[:id])
		add_breadcrumb @state.name, admin_country_state_path(@country, @state)
	end
end
