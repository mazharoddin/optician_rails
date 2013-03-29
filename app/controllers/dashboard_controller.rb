class DashboardController < ApplicationController
	before_filter :find_current_location, :only => [ :index ]
	
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
	def find_current_location
	  @current_location = @current_account.locations.first
	end
end
