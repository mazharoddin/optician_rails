class Inventory::LensesController < Inventory::ApplicationController
	add_breadcrumb "Lenses", :inventory_lens_inventory_index_path

	before_filter :find_inventory, :only => [:edit, :show, :update]
	authorize_resource :LensInventory, :parent => false
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :inventory_lenses_inventory_path
			@items = LensInventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
		else
			@items = LensInventory.order(:description).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", :new_inventory_lens_inventory_path

		@item = LensInventory.new(params[:lens_inventory])
		@item.account_id = @current_account.id
		@item.number = @current_account.next_inventory_number if @item.number == nil
		if @item.save then
			@current_account.next_patient_number = @current_account.next_patient_number + 1
			@current_account.save
			flash[:success] = "Lenses inventory has been created."
			redirect_to :action => 'index', :controller => 'inventory'
		else
			msg = ''
			@item.errors.each do |error|
			    msg = msg + error.to_s + ' - ' + @item.errors[error].to_s + "\n"
			end
			flash[:error] = msg
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_inventory_lens_inventory_path(@current_account, @item)
	end
	
	def new
		@item = LensInventory.new
	end
	
	def show
	end
	
	def update
		if @item.update_attributes(params[:lens_inventory]) then
			flash[:success] = "Lenses inventory has been updated."
			redirect_to :action => 'index', :controller => 'inventory'
		else
			render "edit"
		end
	end

	private
	def find_inventory
		@item = LensInventory.where('number = ?', params[:id]).first!
		add_breadcrumb @item.description, inventory_lens_inventory_path(@current_account, @item)
	end
end
