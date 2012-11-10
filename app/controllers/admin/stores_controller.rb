class Admin::StoresController < Admin::ApplicationController
	before_filter :find_store, :only => [:edit, :show, :update]
	
	add_breadcrumb "Stores", :admin_stores_path


	def index
		@stores = Store.page(params[:page])
	end
	
	def create
		add_breadcrumb "New", new_admin_store_path

		@store = Store.new(params[:store])
		if @store.save then
			flash[:success] = "Store has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @store.name, admin_store_path(@store)
		add_breadcrumb "Edit", edit_admin_store_path(@store)
	end
	
	def new
		add_breadcrumb "New", new_admin_store_path

		@store = Store.new
	end
	
	def show
		add_breadcrumb @store.name, admin_store_path(@store)
	end
	
	def update
		add_breadcrumb @store.name, admin_store_path(@store)

		if @store.update_attributes(params[:store]) then
			flash[:success] = "Store has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_store
		@store = Store.find(params[:id])
	end
end
