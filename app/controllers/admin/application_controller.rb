require 'BootstrapBreadcrumbsBuilder'

class Admin::ApplicationController < ApplicationController
	protect_from_forgery

	add_breadcrumb "Admin", :admin_root_path
end
