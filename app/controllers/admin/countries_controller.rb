class Admin::CountriesController < ApplicationController
	def index
		@countries = Country.page(params[:page])
	end
	
	def create
		@country = Country.new(params[:country])
		if @country.save then
			flash[:notice] = "Country has been created."
			redirect_to [:admin, @country]
		else
			render "new"
		end
	end
	
	def edit
		@country = Country.find(params[:id])
	end
	
	def new
		@country = Country.new
	end
	
	def show
		@country = Country.find(params[:id])
		render "edit"
	end
	
	def update
		@country = Country.find(params[:id])
		if @country.update_attributes(params[:country]) then
			flash[:notice] = "Country has been updated."
			redirect_to [:admin, @country]
		else
			render "edit"
		end
	end
end
