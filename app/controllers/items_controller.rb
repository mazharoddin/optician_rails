class ItemsController < ApplicationController
	add_breadcrumb "Invoices", :invoices_path

	before_filter :find_invoice
	before_filter :find_item, :only => [:destroy, :edit, :show, :update]
	authorize_resource :class => 'Invoice'
	
	def index
		redirect_to invoice_path(@current_account, @invoice)
	end
	
	def create
		add_breadcrumb "New", new_invoice_item_path(@current_account, @invoice)

		if params[:inventory_id] == nil then
			@item = @invoice.items.build(params[:item])
			@item.account_id = @invoice.account_id
			if @item.save then
				flash[:success] = "Item has been created."
				redirect_to invoice_path(@current_account, @invoice)
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

	def destroy
		if @item == nil
			flash[:notice] = "Item not found"
		else
			@item.destroy
			flash[:success] = "Item removed"
		end
		
		redirect_to invoice_path(@invoice)
	end
	
	def edit
		add_breadcrumb "Edit", edit_invoice_item_path(@current_account, @invoice, @item)
	end
	
	def new
		add_breadcrumb "New", new_invoice_item_path(@current_account, @invoice)
		@item = @invoice.items.build(:discount => 0.00, :qty => 1)
	end
	
	def show
	end
	
	def update
		if @item.update_attributes(params[:item]) then
			flash[:success] = "Item has been updated."
			redirect_to invoice_path(@current_account, @invoice)
		else
			render "edit"
		end
	end

	def accessories
		add_breadcrumb "Accessories", accessories_invoice_items_path(@current_account, @invoice)
		if can? :read, :Inventory
			if params[:q] then
				add_breadcrumb "Search Results", :inventory_services_inventory_path
				@items = @current_account.accessories_inventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
			else
				@items = @current_account.accessories_inventory.order(:description).page(params[:page])
			end
		end
	end
	
	def services
		add_breadcrumb "Services", services_invoice_items_path(@current_account, @invoice)
		if can? :read, :Inventory
			if params[:q] then
				add_breadcrumb "Search Results", :inventory_services_inventory_path
				@items = @current_account.services_inventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
			else
				@items = @current_account.services_inventory.order(:description).page(params[:page])
			end
		end
	end
	
	private
	def find_item
		@item = @invoice.items.find(params[:id])
		add_breadcrumb '#' + @item.id.to_s, invoice_item_path(@current_account, @invoice, @item)
	end

	def navbar
	  @navbar_selected = 'invoice'
	end
	
	def find_invoice
	  @invoice = Invoice.find(params[:invoice_id])
      add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@current_account, @invoice)
      add_breadcrumb "Items", invoice_path(@current_account, @invoice)
	end
end
