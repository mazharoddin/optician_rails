class Inventory::AccessoriesController < Inventory::ApplicationController
	add_breadcrumb "Accessories", :inventory_accessories_inventory_index_path

	before_filter :find_inventory, :only => [:edit, :show, :update]
	authorize_resource :AccessoriesInventory, :parent => false
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :inventory_accessories_inventory_path
			@items = AccessoriesInventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
		else
			@items = AccessoriesInventory.order(:description).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", :new_inventory_accessories_inventory_path

		@item = AccessoriesInventory.new(params[:accessories_inventory])
		@item.account_id = @current_account.id
		if @item.save then
			flash[:success] = "Accessories inventory has been created."
			redirect_to :action => 'index', :controller => 'inventory'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_inventory_accessories_inventory_path(@current_account, @item)
	end
	
	def new
		add_breadcrumb "New", :new_inventory_accessories_inventory_path

		@item = AccessoriesInventory.new
	end
	
	def show
	end
	
	def update
		if @item.update_attributes(params[:accessories_inventory]) then
			flash[:success] = "Accessories inventory has been updated."
			redirect_to :action => 'index', :controller => 'inventory'
		else
			render "edit"
		end
	end

	private
	def find_inventory
		@item = AccessoriesInventory.find(params[:id])
		add_breadcrumb @item.description, inventory_accessories_inventory_path(@current_account, @item)
	end
end
