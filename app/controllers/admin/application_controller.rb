class Admin::ApplicationController < ApplicationController
	protect_from_forgery

	add_breadcrumb "Administration", :admin_root_path
end
