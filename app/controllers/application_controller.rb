require 'BootstrapBreadcrumbsBuilder'

class ApplicationController < ActionController::Base
	protect_from_forgery

	before_filter :authenticate_employee!

	add_breadcrumb "Home", :root_path
end
