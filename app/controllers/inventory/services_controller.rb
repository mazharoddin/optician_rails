class Inventory::ServicesController < Inventory::ApplicationController
	before_filter :find_inventory, :only => [:edit, :show, :update]
	
	add_breadcrumb "Services", :inventory_services_inventory_index_path

	def index
		@items = ServicesInventory.order(:description).page(params[:page])
	end
	
	def create
		add_breadcrumb "New", new_inventory_services_inventory_path

		@item = ServicesInventory.new(params[:services_inventory])
		@item.track_inventory = false
		if @item.save then
			flash[:success] = "Services inventory has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @item.description, inventory_services_inventory_path(@item)
		add_breadcrumb "Edit", edit_inventory_services_inventory_path(@item)
	end
	
	def new
		add_breadcrumb "New", new_inventory_services_inventory_path

		@item = ServicesInventory.new
	end
	
	def show
		add_breadcrumb @item.description, inventory_services_inventory_path(@item)
	end
	
	def update
		add_breadcrumb @item.description, inventory_services_inventory_path(@item)

		if @item.update_attributes(params[:services_inventory]) then
			flash[:success] = "Services inventory has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_inventory
		@item = ServicesInventory.find(params[:id])
	end
end
