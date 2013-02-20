class Admin::DashboardController < Admin::ApplicationController
    authorize_resource :class => :admin_dashboard
	
	def index
	end
end
