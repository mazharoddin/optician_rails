class GlassesDispensingController < ApplicationController
	add_breadcrumb "Invoices", :invoices_path

	before_filter :find_invoice
	before_filter :find_dispensing, :only => [:edit, :show, :update]
	authorize_resource	
	
	def index
		@dispensing = @invoice.glasses_dispensing.page(params[:page])
	end
	
	def create
		add_breadcrumb "New", new_invoice_glasses_dispensing_path(@current_account, @invoice)

		@dispensing = @invoice.glasses_dispensing.build(params[:glasses_dispensing])
		@dispensing.patient = @invoice.patient
		if @dispensing.save then
			flash[:success] = "Glasses dispensing has been created."
			redirect_to invoice_path(@current_account, @invoice)
		else
			render "new"
		end
	end
	
	def edit
		redirect_to :action => 'show'
	end
	
	def new
		add_breadcrumb "New", new_invoice_glasses_dispensing_path(@current_account, @invoice)
		
		@dispensing = @invoice.glasses_dispensing.build
	end
	
	def show
	end
	
	def update
		if @dispensing.update_attributes(params[:glasses_prescription]) then
			flash[:success] = "Glasses dispensing has been updated."
			redirect_to invoice_glasses_dispensing_path(@current_account, @invoice, @dispensing)
		else
			render "edit"
		end
	end
	
	private
	def find_invoice
		@invoice = @current_account.invoices.find(params[:invoice_id])
		add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@current_account, @invoice)
		add_breadcrumb "Glasses Dispensing", invoice_glasses_dispensing_path(@current_account, @invoice)
	end

	def find_dispensing
		@dispensing = @invoice.glasses_dispensing.find(params[:id])
		add_breadcrumb @dispensing.rx_date, invoice_glasses_dispensing_path(@current_account, @invoice, @dispensing)
	end

	def navbar
	  @navbar_selected = 'invoices'
	end
end
