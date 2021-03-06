class InvoicesController < ApplicationController
	add_breadcrumb "Invoices", :invoices_path

	before_filter :find_invoice, :only => [:edit, :show, :update, :patients, :set_patient, :set_cash_sale, :void_invoice]
	authorize_resource	
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :invoices_path
			@invoices = @current_account.invoices.where('id like ?', '%' + params[:q] + '%').order(:invoice_date).page(params[:page])
		else
			@invoices = @current_account.invoices.order(:invoice_date).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", :new_invoice_path

		@invoice = @current_account.invoices.build
		if @invoice.save
			redirect_to invoice_path(@current_account, @invoice)
		else
			flash[:alert] = "Unable to create invoice"
			redirect_to :invoices_path
		end
	end
	
	def edit
		redirect_to :action => 'show'
	end
	
	def new
		add_breadcrumb "New", :new_invoice_path

		flash[:notice] = "You can't create a new invoice this way. Try using the New Invoice button."
		
		redirect_to invoices_path(@current_account)
	end
	
	def show
	end
	
	def update
		if @invoice.update_attributes(params[:invoice]) then
			flash[:success] = "Invoice has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	def patients
		add_breadcrumb 'Select Patient', invoice_patients_path(@current_account, @invoice)
		if params[:q] then
			add_breadcrumb "Search Results", :patients_path
			@patients = Patient.where('account_id = ?', @current_account).where('last_name like ? or first_name like ?', '%' + params[:q] + '%', '%' + params[:q] + '%').order(:last_name).order(:first_name).page(params[:page])
		else
			@patients = Patient.where('account_id = ?', @current_account).order(:last_name).order(:first_name).page(params[:page])
		end
	end
	
	def set_patient
	    @patient = @current_account.patients.find(params[:id])
		@invoice.patient = @patient

		if @invoice.save then
			flash[:success] = "Invoice updated"
			redirect_to invoice_path(@current_account, @invoice)
		else
		    flash[:error] = "Unable to set patient"
			redirect_to :action => 'patients'
		end
	end
	
	def set_cash_sale
		@invoice.patient = nil
		@invoice.name = 'Cash Sale'

		if @invoice.save then
			flash[:success] = "Invoice updated"
		else
		    flash[:error] = "Unable to set to cash sale"
		end
		redirect_to invoice_path(@current_account, @invoice)
	end
	
	def void_invoice
		if @invoice.invoice_date == nil then
			@invoice.void_date = DateTime.now
			if @invoice.save then
				flash[:success] = "Invoice voided"
				redirect_to :action => "index"
			else
				flash[:error] = "Unable to save change"
				redirect_to invoice_path(@current_account, @invoice)
			end
		else
			flash[:error] = "You cannot void this invoice. Create a refund instead."
			redirect_to invoice_path(@current_account, @invoice)
		end
	end
	
	private
	def find_invoice
		if params[:invoice_id] then
			@invoice = @current_account.invoices.find(params[:invoice_id])
		else
			@invoice = @current_account.invoices.find(params[:id])
		end
		add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@current_account, @invoice)
	end

	def navbar
	  @navbar_selected = 'invoices'
	end
end
