class ItemsController < ApplicationController
	before_filter :find_invoice
	before_filter :find_item, :only => [:edit, :show, :update]
	
	add_breadcrumb "Invoices", :invoices_path

	def index
		redirect_to invoice_path(@invoice)
	end
	
	def create
		add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@invoice)
		add_breadcrumb "Items", invoice_path(@invoice)
		add_breadcrumb "New", new_invoice_item_path(@invoice)

		if params[:inventory_id] == nil then
			@item = @invoice.items.build(params[:item])
			if @item.save then
				flash[:success] = "Item has been created."
				redirect_to invoice_path(@invoice)
			else
				render "new"
			end
		else
			render "xxx"
		end
	end
	
	def edit
		add_breadcrumb @country.name, admin_country_path(@country)
		add_breadcrumb "States", admin_country_states_path(@country)
		add_breadcrumb @state.name, admin_country_state_path(@country, @state)
		add_breadcrumb "Edit", edit_admin_country_state_path(@country, @state)

		@item = @invoice.items.find(params[:id])
	end
	
	def new
		add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@invoice)
		add_breadcrumb "Items", invoice_path(@invoice)
		add_breadcrumb "New", new_invoice_item_path(@invoice)
		
		@item = @invoice.items.build
	end
	
	def show
		add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@invoice)
		add_breadcrumb "Items", invoice_path(@invoice)
		add_breadcrumb '#' + @item.id.to_s, invoice_item_path(@invoice, @item)

		@item = @invoice.items.find(params[:id])
	end
	
	def update
		add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@invoice)
		add_breadcrumb "Items", invoice_path(@invoice)
		add_breadcrumb '#' + @item.id.to_s, invoice_item_path(@invoice, @item)

		@item = @invoice.items.find(params[:id])
		if @item.update_attributes(params[:item]) then
			flash[:success] = "Item has been updated."
			redirect_to invoice_path(@invoice)
		else
			render "edit"
		end
	end

	def accessories
		add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@invoice)
		add_breadcrumb "Items", invoice_path(@invoice)
		add_breadcrumb "Accessories", accessories_invoice_items_path(@invoice)
		if params[:q] then
			add_breadcrumb "Search Results", :inventory_services_inventory_path
			@items = OtherInventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
		else
			@items = OtherInventory.order(:description).page(params[:page])
		end
	end
	
	def services
		add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@invoice)
		add_breadcrumb "Items", invoice_path(@invoice)
		add_breadcrumb "Services", services_invoice_items_path(@invoice)
		if params[:q] then
			add_breadcrumb "Search Results", :inventory_services_inventory_path
			@items = ServicesInventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
		else
			@items = ServicesInventory.order(:description).page(params[:page])
		end
	end
	
	private
	def find_item
		@item = @invoice.items.find(params[:id])
	end

	def navbar
	  @navbar_selected = 'invoice'
	end
	
	def find_invoice
	  @invoice = Invoice.find(params[:invoice_id])
	end
end
