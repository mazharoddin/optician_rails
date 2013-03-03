class DashboardController < ApplicationController
	before_filter :find_current_store, :only => [ :index ]
	
	skip_before_filter :authenticate_user!, :only => [ :home ]

	authorize_resource :class => :dashboard

	def index
		render :layout => "dashboard"
	end
	
	def home
		if current_user != nil
			redirect_to '/' + current_user.account.subdomain  # FIXME why doesn't dashboard(@current_user.account) work?
		else
			render :layout => "application"
		end
	end

	private
	def find_current_store
	  @current_store = @current_account.stores.first
	end
end
