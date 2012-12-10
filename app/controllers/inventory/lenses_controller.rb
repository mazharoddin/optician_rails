class Inventory::LensesController < Inventory::ApplicationController
	before_filter :find_inventory, :only => [:edit, :show, :update]
	
	add_breadcrumb "Lenses", :inventory_lens_inventory_index_path

	def index
		if params[:q] then
			add_breadcrumb "Search Results", :inventory_lenses_inventory_path
			@items = LensInventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
		else
			@items = LensInventory.order(:description).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_inventory_lens_inventory_path

		@item = LensInventory.new(params[:lens_inventory])
		if @item.save then
			flash[:success] = "Lenses inventory has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @item.description, inventory_lens_inventory_path(@item)
		add_breadcrumb "Edit", edit_inventory_lens_inventory_path(@item)
	end
	
	def new
		add_breadcrumb "New", new_inventory_lens_inventory_path

		@item = LensInventory.new
	end
	
	def show
		add_breadcrumb @item.description, inventory_lens_inventory_path(@item)
	end
	
	def update
		add_breadcrumb @item.description, inventory_lens_inventory_path(@item)

		if @item.update_attributes(params[:lens_inventory]) then
			flash[:success] = "Lenses inventory has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_inventory
		@item = LensInventory.find(params[:id])
	end
end
