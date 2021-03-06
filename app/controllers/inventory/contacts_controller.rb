class Inventory::ContactsController < Inventory::ApplicationController
	add_breadcrumb "Contacts", :inventory_contacts_inventory_index_path

	before_filter :find_inventory, :only => [:edit, :show, :update]
	authorize_resource :ContactsInventory, :parent => false
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :inventory_contacts_inventory_path
			@items = ContactsInventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
		else
			@items = ContactsInventory.order(:description).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", :new_inventory_contacts_inventory_path

		@item = ContactsInventory.new(params[:contacts_inventory])
		@item.number = @current_account.next_inventory_number if @item.number == nil
		@item.account_id = @current_account.id
		if @item.save then
			@current_account.next_patient_number = @current_account.next_patient_number + 1
			@current_account.save
			flash[:success] = "Contacts inventory has been created."
			redirect_to :action => 'index', :controller => 'inventory'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_inventory_contacts_inventory_path(@current_account, @item)
	end
	
	def new
		add_breadcrumb "New", :new_inventory_contacts_inventory_path

		@item = ContactsInventory.new
	end
	
	def show
	end
	
	def update
		if @item.update_attributes(params[:contacts_inventory]) then
			flash[:success] = "Contacts inventory has been updated."
			redirect_to :action => 'index', :controller => 'inventory'
		else
			render "edit"
		end
	end

	private
	def find_inventory
		@item = ContactsInventory.where('number = ?', params[:id]).first!
		add_breadcrumb @item.description, inventory_contacts_inventory_path(@current_account, @item)
	end
end
