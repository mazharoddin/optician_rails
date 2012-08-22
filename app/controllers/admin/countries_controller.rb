class Admin::CountriesController < ApplicationController
	before_filter :find_country, :only => [:edit, :show, :update]
	
	def find_country
		@country = Country.find(params[:id])
	end

	def index
		@countries = Country.page(params[:page])
	end
	
	def create
		@country = Country.new(params[:country])
		if @country.save then
			flash[:success] = "Country has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
	end
	
	def new
		@country = Country.new
	end
	
	def show
		@states = @country.states.page(params[:page])
		render "edit"
	end
	
	def update
		if @country.update_attributes(params[:country]) then
			flash[:success] = "Country has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end
end
