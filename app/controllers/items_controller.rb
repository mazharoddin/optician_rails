class ItemsController < ApplicationController
	add_breadcrumb "Invoices", :invoices_path

	before_filter :find_invoice
	before_filter :find_item, :only => [:edit, :show, :update]
	authorize_resource	
	
	def index
		redirect_to invoice_path(@invoice)
	end
	
	def create
		add_breadcrumb "New", new_invoice_item_path(@invoice)

		if params[:inventory_id] == nil then
			@item = @invoice.items.build(params[:item])
			@item.total_price = (@item.unit_price - @item.discount) * @item.qty
			@item.account_id = @invoice.account_id
			if @item.save then
				flash[:success] = "Item has been created."
				redirect_to invoice_path(@invoice)
			else
			    @item.errors.each do |error|
				    flash[:alert] = error.to_s
				end
				render "new"
			end
		else
			render "xxx"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_invoice_item_path(@invoice, @item)
	end
	
	def new
		add_breadcrumb "New", new_invoice_item_path(@invoice)
		@item = @invoice.items.build(:discount => 0.00, :qty => 1)
	end
	
	def show
	end
	
	def update
		if @item.update_attributes(params[:item]) then
			flash[:success] = "Item has been updated."
			redirect_to invoice_path(@invoice)
		else
			render "edit"
		end
	end

	def accessories
		add_breadcrumb "Accessories", accessories_invoice_items_path(@invoice)
		if params[:q] then
			add_breadcrumb "Search Results", :inventory_services_inventory_path
			@items = @current_account.accessories_inventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
		else
			@items = @current_account.accessories_inventory.order(:description).page(params[:page])
		end
	end
	
	def services
		add_breadcrumb "Services", services_invoice_items_path(@invoice)
		if params[:q] then
			add_breadcrumb "Search Results", :inventory_services_inventory_path
			@items = @current_account.services_inventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
		else
			@items = @current_account.services_inventory.order(:description).page(params[:page])
		end
	end
	
	private
	def find_item
		@item = @invoice.items.find(params[:id])
		add_breadcrumb '#' + @item.id.to_s, invoice_item_path(@invoice, @item)
	end

	def navbar
	  @navbar_selected = 'invoice'
	end
	
	def find_invoice
	  @invoice = Invoice.find(params[:invoice_id])
      add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@invoice)
      add_breadcrumb "Items", invoice_path(@invoice)
	end
end
