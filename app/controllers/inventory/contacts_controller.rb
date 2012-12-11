class Inventory::ContactsController < Inventory::ApplicationController
	before_filter :find_inventory, :only => [:edit, :show, :update]
	
	add_breadcrumb "Contacts", :inventory_contacts_inventory_index_path

	def index
		if params[:q] then
			add_breadcrumb "Search Results", :inventory_contacts_inventory_path
			@items = ContactsInventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
		else
			@items = ContactsInventory.order(:description).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_inventory_contacts_inventory_path

		@item = ContactsInventory.new(params[:contacts_inventory])
		if @item.save then
			flash[:success] = "Contacts inventory has been created."
			redirect_to :action => 'index', :controller => 'inventory'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @item.description, inventory_contacts_inventory_path(@item)
		add_breadcrumb "Edit", edit_inventory_contacts_inventory_path(@item)
	end
	
	def new
		add_breadcrumb "New", new_inventory_contacts_inventory_path

		@item = ContactsInventory.new
	end
	
	def show
		add_breadcrumb @item.description, inventory_contacts_inventory_path(@item)
	end
	
	def update
		add_breadcrumb @item.description, inventory_contacts_inventory_path(@item)

		if @item.update_attributes(params[:contacts_inventory]) then
			flash[:success] = "Contacts inventory has been updated."
			redirect_to :action => 'index', :controller => 'inventory'
		else
			render "edit"
		end
	end

	private
	def find_inventory
		@item = ContactsInventory.find(params[:id])
	end
end
