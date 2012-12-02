class Inventory::ApplicationController < ApplicationController

	add_breadcrumb "Inventory", :inventory_root_path

	private
	def navbar
	  @navbar_selected = 'inventory'
	end
end
