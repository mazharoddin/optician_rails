require 'BootstrapBreadcrumbsBuilder'

class ApplicationController < ActionController::Base
	protect_from_forgery

	before_filter :authenticate_user!
	before_filter :set_current_account
	before_filter :navbar

	add_breadcrumb "Home", :root_path

	def current_ability
	  Ability.new(current_user, @current_account)
	end
	
	private
	def set_current_account
	  if params[:subdomain] != nil
	    @current_account = Account.where('subdomain = ?', params[:subdomain]).first()
	  else
	    @current_account = nil
	  end
	end
	
	def navbar
	  @navbar_selected = 'dashboard'
	end
end
