class Inventory::OtherController < Inventory::ApplicationController
	before_filter :find_inventory, :only => [:edit, :show, :update]
	
	add_breadcrumb "Other", :inventory_other_inventory_index_path

	def index
		if params[:q] then
			add_breadcrumb "Search Results", :inventory_other_inventory_path
			@items = OtherInventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
		else
			@items = OtherInventory.order(:description).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_inventory_other_inventory_path

		@item = OtherInventory.new(params[:other_inventory])
		if @item.save then
			flash[:success] = "Other inventory has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @item.description, inventory_other_inventory_path(@item)
		add_breadcrumb "Edit", edit_inventory_other_inventory_path(@item)
	end
	
	def new
		add_breadcrumb "New", new_inventory_other_inventory_path

		@item = OtherInventory.new
	end
	
	def show
		add_breadcrumb @item.description, inventory_other_inventory_path(@item)
	end
	
	def update
		add_breadcrumb @item.description, inventory_other_inventory_path(@item)

		if @item.update_attributes(params[:other_inventory]) then
			flash[:success] = "Other inventory has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_inventory
		@item = OtherInventory.find(params[:id])
	end
end
