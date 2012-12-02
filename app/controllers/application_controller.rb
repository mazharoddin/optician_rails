require 'BootstrapBreadcrumbsBuilder'

class ApplicationController < ActionController::Base
	protect_from_forgery

	before_filter :authenticate_employee!
	before_filter :navbar

	add_breadcrumb "Home", :root_path
	
	private
	def navbar
	  @navbar_selected = 'dashboard'
	end
end
