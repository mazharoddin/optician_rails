require 'BootstrapBreadcrumbsBuilder'

class ApplicationController < ActionController::Base
	protect_from_forgery

	before_filter :authenticate_user!
	before_filter :set_current_account
	before_filter :navbar


	def current_ability
	  Ability.new(current_user, @current_account)
	end
	
	private
	def set_current_account
	  if params[:subdomain] != nil
	    @current_account = Account.where('subdomain = ?', params[:subdomain]).first()
		add_breadcrumb "Home", dashboard_path(@current_account)
	  else
	    @current_account = nil
		add_breadcrumb "Home", :root_path
	  end
	  
	end
	
	def navbar
	  @navbar_selected = 'dashboard'
	end
end
