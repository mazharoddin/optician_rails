require 'BootstrapBreadcrumbsBuilder'

class ApplicationController < ActionController::Base
	protect_from_forgery

	before_filter :authenticate_user!
	before_filter :set_current_account
	before_filter :navbar

	add_breadcrumb "Home", :root_path

	private
	def set_current_account
	  if current_user != nil
		@current_account = current_user.account
	  else
	    @current_account = nil
	  end
	  if @current_account == nil
	    @current_account = Account.find(1)
	  end
	end
	
	def navbar
	  @navbar_selected = 'dashboard'
	end
end
