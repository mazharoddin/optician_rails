class Admin::CountriesController < Admin::ApplicationController
	before_filter :find_country, :only => [:edit, :show, :update]
	
	add_breadcrumb "Countries", :admin_countries_path

	def find_country
		@country = Country.find(params[:id])
	end

	def index
		@countries = Country.order(:name).page(params[:page])
	end
	
	def create
		add_breadcrumb "New", :new_admin_country_path

		@country = Country.new(params[:country])
		if @country.save then
			flash[:success] = "Country has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @country.name, admin_country_path(@country)
		add_breadcrumb "Edit", edit_admin_country_path(@country)
	end
	
	def new
		add_breadcrumb "New", :new_admin_country_path

		@country = Country.new
	end
	
	def show
		add_breadcrumb @country.name, admin_country_path(@country)

		@states = @country.states.order(:name).page(params[:page])
	end
	
	def update
		add_breadcrumb @country.name, admin_country_path(@country)

		if @country.update_attributes(params[:country]) then
			flash[:success] = "Country has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end
end
