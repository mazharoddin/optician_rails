class Admin::CountriesController < ApplicationController
	before_filter :find_country, :only => [:edit, :show, :update]
	
	def find_country
		@page_title = "Find Country"
		@country = Country.find(params[:id])
	end

	def index
		@page_title = "Countries"
		@countries = Country.page(params[:page])
	end
	
	def create
		@page_title = "Create Country"
		@country = Country.new(params[:country])
		if @country.save then
			flash[:success] = "Country has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		@page_title = "Edit Country"
	end
	
	def new
		@page_title = "New Country"
		@country = Country.new
	end
	
	def show
		@page_title = "Show Country"
		@states = @country.states.page(params[:page])
		render "edit"
	end
	
	def update
		@page_title = "Update Country"
		if @country.update_attributes(params[:country]) then
			flash[:success] = "Country has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end
end
