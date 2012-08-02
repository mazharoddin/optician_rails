class Admin::CountriesController < ApplicationController
	def index
		@countries = Country.page(params[:page])
	end
	
	def create
		@country = Country.new(params[:country])
		@country.save
		flash[:notice] = "Country has been created."
		redirect_to [:admin, @country]
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
		@country.update_attributes(params[:country])
		flash[:notice] = "Country has been updated."
		redirect_to [:admin, @country]
	end
end
