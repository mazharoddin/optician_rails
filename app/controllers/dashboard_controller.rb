class DashboardController < ApplicationController
	before_filter :find_current_store

	def index
		render :layout => "dashboard"
	end

	private
	def find_current_store
	  @current_store = @current_account.stores.first
	end
end
