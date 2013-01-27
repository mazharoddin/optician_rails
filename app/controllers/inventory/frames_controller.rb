class Inventory::FramesController < Inventory::ApplicationController
	add_breadcrumb "Frames", :inventory_frames_inventory_index_path

	before_filter :find_inventory, :only => [:edit, :show, :update]
	authorize_resource :FramesInventory, :parent => false
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :inventory_frames_inventory_path
			@items = FramesInventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
		else
			@items = FramesInventory.order(:description).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_inventory_frames_inventory_path

		@item = FramesInventory.new(params[:frames_inventory])
		@item.account_id = @current_account.id
		if @item.save then
			flash[:success] = "Frames inventory has been created."
			redirect_to :action => 'index', :controller => 'inventory'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_inventory_frames_inventory_path(@item)
	end
	
	def new
		add_breadcrumb "New", new_inventory_frames_inventory_path

		@item = FramesInventory.new
	end
	
	def show
	end
	
	def update
		if @item.update_attributes(params[:frames_inventory]) then
			flash[:success] = "Frames inventory has been updated."
			redirect_to :action => 'index', :controller => 'inventory'
		else
			render "edit"
		end
	end

	private
	def find_inventory
		@item = FramesInventory.find(params[:id])
		add_breadcrumb @item.description, inventory_frames_inventory_path(@item)
	end
end
