class ContactsDispensingController < ApplicationController
	before_filter :find_invoice
	before_filter :find_dispensing, :only => [:edit, :show, :update]
	
	add_breadcrumb "Invoices", :invoices_path
	
	def index
		add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@invoice)
		add_breadcrumb "Contacts Dispensing", invoice_contacts_dispensing_path(@invoice)

		@dispensing = @invoice.contacts_dispensing.page(params[:page])
	end
	
	def create
		add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@invoice)
		add_breadcrumb "Contacts Dispensing", invoice_path(@invoice)
		add_breadcrumb "New", new_invoice_contacts_dispensing_path(@invoice)

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
		add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@invoice)
		add_breadcrumb "Contacts Dispensing", invoice_path(@invoice)
		add_breadcrumb "New", new_invoice_contacts_dispensing_path(@invoice)
		
		@dispensing = @invoice.contacts_dispensing.build
	end
	
	def show
		add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@invoice)
		add_breadcrumb "Contacts Dispensing", invoice_contacts_dispensing_path(@invoice)
		add_breadcrumb @dispensing.rx_date, invoice_contacts_dispensing_path(@invoice, @dispensing)
	end
	
	def update
		add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@invoice)
		add_breadcrumb "Contacts Dispensing", invoice_contacts_dispensing_path(@invoice)
		add_breadcrumb @dispensing.rx_date, invoice_contacts_dispensing_path(@invoice, @dispensing)

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
	end

	def find_dispensing
		@dispensing = @invoice.contacts_dispensing.find(params[:id])
	end

	def navbar
	  @navbar_selected = 'invoices'
	end
end
