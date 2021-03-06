class Inventory::ServicesController < Inventory::ApplicationController
	add_breadcrumb "Services", :inventory_services_inventory_index_path

	before_filter :find_inventory, :only => [:edit, :show, :update]
	authorize_resource :ServicesInventory, :parent => false
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :inventory_services_inventory_path
			@items = ServicesInventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
		else
			@items = ServicesInventory.order(:description).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", :new_inventory_services_inventory_path

		@item = ServicesInventory.new(params[:services_inventory])
		@item.track_inventory = false
		@item.account_id = @current_account.id
		@item.number = @current_account.next_inventory_number if @item.number == nil
		if @item.save then
			@current_account.next_patient_number = @current_account.next_patient_number + 1
			@current_account.save
			flash[:success] = "Services inventory has been created."
			redirect_to :action => 'index', :controller => 'inventory'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_inventory_services_inventory_path(@current_account, @item)
	end
	
	def new
		add_breadcrumb "New", new_inventory_services_inventory_path

		@item = ServicesInventory.new
	end
	
	def show
	end
	
	def update
		if @item.update_attributes(params[:services_inventory]) then
			flash[:success] = "Services inventory has been updated."
			redirect_to :action => 'index', :controller => 'inventory'
		else
			render "edit"
		end
	end

	private
	def find_inventory
		@item = ServicesInventory.where('number = ?', params[:id]).first!
		add_breadcrumb @item.description, inventory_services_inventory_path(@current_account, @item)
	end
end
