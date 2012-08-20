class Admin::StatesController < ApplicationController
	before_filter :find_country
	
	def find_country
		@country = Country.find(params[:country_id])
	end
	
	def index
		@states = @country.states.page(params[:page])
	end
	
	def create
		@state = @country.states.build(params[:state])
		if @state.save then
			flash[:success] = "State has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		@state = @country.states.find(params[:id])
	end
	
	def new
		#@states = @country.states.build(params[:country])
		@state = @country.states.build
	end
	
	def show
		@state = @country.states.find(params[:id])
		render "edit"
	end
	
	def update
		@state = @country.states.find(params[:id])
		if @state.update_attributes(params[:state]) then
			flash[:success] = "State has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end
end
