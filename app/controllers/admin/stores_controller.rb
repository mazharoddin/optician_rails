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

		@store = Store.new(
#			:name => "Kanata Opticians",
#			:address => "150 Katimavik Rd\nKanata, ON.",
#			:city => "Kanata",
#			:postal_code => "",
#			:phone => "(613) 592-1885",
#			:email => "info@kanataopticians.com",
#			:url => "www.kanataopticians.com",
#			:fax => "",
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
