class Admin::StoresController < Admin::ApplicationController
	add_breadcrumb "Stores", :admin_stores_path

	before_filter :find_store, :only => [:edit, :show, :update]
	authorize_resource	
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_stores_path
			@stores = @current_account.stores.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@stores = @current_account.stores.order(:name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_store_path

		@store = @current_account.stores.build(params[:store])
		if @store.save then
			flash[:success] = "Store has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_admin_store_path(@store)
	end
	
	def new
		add_breadcrumb "New", new_admin_store_path

		@store = @current_account.stores.build(
			:monday_open => "09:00",
			:monday_close => "18:00",
			:tuesday_open => "09:00",
			:tuesday_close => "18:00",
			:wednesday_open => "09:00",
			:wednesday_close => "18:00",
			:thursday_open => "09:00",
			:thursday_close => "18:00",
			:friday_open => "09:00",
			:friday_close => "18:00",
			:saturday_open => "09:00",
			:saturday_close => "18:00",
			:sunday_open => "09:00",
			:sunday_close => "18:00"
			)
	end
	
	def show
	end
	
	def update
		if @store.update_attributes(params[:store]) then
			flash[:success] = "Store has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_store
		@store = @current_account.stores.find(params[:id])
		add_breadcrumb @store.name, admin_store_path(@store)
	end
end
