class DashboardController < ApplicationController
	def index
		@page_title = "Home"
		
		render :layout => "dashboard"
	end
end
