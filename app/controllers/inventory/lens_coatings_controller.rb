class Inventory::LensCoatingsController < Inventory::ApplicationController
	add_breadcrumb "Lens Coatings", :inventory_lens_coatings_inventory_index_path

	before_filter :find_inventory, :only => [:edit, :show, :update]
	authorize_resource :LensCoatingsInventory, :parent => false
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :inventory_lens_coatings_inventory_path
			@items = LensCoatingsInventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
		else
			@items = LensCoatingsInventory.order(:description).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", :new_inventory_lens_coatings_inventory_path

		@item = LensCoatingsInventory.new(params[:lens_coatings_inventory])
		@item.track_inventory = false
		@item.account_id = @current_account.id
		if @item.save then
			flash[:success] = "Lens coatings inventory has been created."
			redirect_to :action => 'index', :controller => 'inventory'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_inventory_lens_coatings_inventory_path(@current_account, @item)
	end
	
	def new
		add_breadcrumb "New", :new_inventory_lens_coatings_inventory_path

		@item = LensCoatingsInventory.new
		@item.track_inventory = false
	end
	
	def show
	end
	
	def update
		if @item.update_attributes(params[:lens_coatings_inventory]) then
			flash[:success] = "Lens coatings inventory has been updated."
			redirect_to :action => 'index', :controller => 'inventory'
		else
			render "edit"
		end
	end

	private
	def find_inventory
		@item = LensCoatingsInventory.find(params[:id])
		add_breadcrumb @item.description, inventory_lens_coatings_inventory_path(@current_account, @item)
	end
end
