class DashboardController < ApplicationController
	before_filter :find_current_store, :only => [ :index ]
	
	skip_before_filter :set_current_account, :only => [ :home ]
	skip_before_filter :authenticate_user!, :only => [ :home ]

	authorize_resource :class => :dashboard

	def index
		render :layout => "dashboard"
	end
	
	def home
		render :layout => false
	end

	private
	def find_current_store
	  @current_store = @current_account.stores.first
	end
end
