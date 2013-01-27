class Admin::CountriesController < Admin::ApplicationController
	add_breadcrumb "Countries", :admin_countries_path

	before_filter :find_country, :only => [:edit, :show, :update]
	authorize_resource	
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_countries_path
			@countries = Country.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@countries = Country.order(:name).page(params[:page])
		end
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
		add_breadcrumb "Edit", edit_admin_country_path(@country)
	end
	
	def new
		add_breadcrumb "New", :new_admin_country_path

		@country = Country.new(:active => true)
	end
	
	def show
		@states = @country.states.order(:name).page(params[:page])
	end
	
	def update
		authorize! :update, @country
		if @country.update_attributes(params[:country]) then
			flash[:success] = "Country has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_country
		@country = Country.find(params[:id])
		add_breadcrumb @country.name, admin_country_path(@country)
	end
end
