class ContactsDispensingController < ApplicationController
	add_breadcrumb "Invoices", :invoices_path

	before_filter :find_invoice
	before_filter :find_dispensing, :only => [:edit, :show, :update]
	authorize_resource	
	
	def index
		@dispensing = @invoice.contacts_dispensing.page(params[:page])
	end
	
	def create
		@dispensing = @invoice.contacts_dispensing.build(params[:contacts_dispensing])
		@dispensing.patient = @invoice.patient
		if @dispensing.save then
			flash[:success] = "Contacts dispensing has been created."
			redirect_to invoice_path(@invoice)
		else
			render "new"
		end
	end
	
	def edit
		redirect_to :action => 'show'
	end
	
	def new
		@dispensing = @invoice.contacts_dispensing.build
	end
	
	def show
	end
	
	def update
		if @dispensing.update_attributes(params[:contacts_prescription]) then
			flash[:success] = "Contacts dispensing has been updated."
			redirect_to invoice_contacts_dispensing_path(@invoice, @dispensing)
		else
			render "edit"
		end
	end
	
	private
	def find_invoice
		@invoice = @current_account.invoices.find(params[:invoice_id])
		add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@invoice)
		add_breadcrumb "Contacts Dispensing", invoice_contacts_dispensing_path(@invoice)
	end

	def find_dispensing
		@dispensing = @invoice.contacts_dispensing.find(params[:id])
		add_breadcrumb @dispensing.rx_date, invoice_contacts_dispensing_path(@invoice, @dispensing)
	end

	def navbar
	  @navbar_selected = 'invoices'
	end
end
