require 'BootstrapBreadcrumbsBuilder'

class ApplicationController < ActionController::Base
	protect_from_forgery

	before_filter :set_current_account
	before_filter :authenticate_user!
	before_filter :navbar

	add_breadcrumb "Home", :root_path
	
	private
	def set_current_account
	  @current_account = Account.where('subdomain = ? ', request.subdomains.first).first!
	end
	
	def navbar
	  @navbar_selected = 'dashboard'
	end
end
