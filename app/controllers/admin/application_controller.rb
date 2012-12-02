class Admin::ApplicationController < ApplicationController
	add_breadcrumb "Administration", :admin_root_path

	private
	def navbar
	  @navbar_selected = 'administration'
	end
end
