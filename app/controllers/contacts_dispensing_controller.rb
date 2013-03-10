class ContactsDispensingController < ApplicationController
	add_breadcrumb "Invoices", :invoices_path

	before_filter :find_invoice
	before_filter :find_dispensing, :only => [:edit, :show, :update]
	before_filter :find_brands, :only => [:create, :edit, :new, :show, :update]
	authorize_resource	
	
	def index
		@dispensing = @invoice.contacts_dispensing.page(params[:page])
	end
	
	def create
		@dispensing = @invoice.contacts_dispensing.build(params[:contacts_dispensing])
		@dispensing.account_id = @current_account.id
		@dispensing.patient = @invoice.patient
		if @dispensing.save then
			flash[:success] = "Contacts dispensing has been created."
			redirect_to invoice_path(@current_account, @invoice)
		else
			render "new"
		end
	end
	
	def edit
		redirect_to :action => 'show'
	end
	
	def new
		add_breadcrumb "New", new_invoice_contacts_dispensing_path(@current_account, @invoice)
		
		@prescription = @invoice.patient.contacts_prescriptions.order(:rx_date).first()
		if @prescription == nil
			@dispensing = @invoice.contacts_dispensing.build
		else
			@dispensing = @invoice.contacts_dispensing.build({
				:description => @prescription.description,
				:rx_date => @prescription.rx_date,
				:expiry_date => @prescription.expiry_date,
				:optometrist_id => @prescription.optometrist_id,
				:notes => @prescription.notes,
				:od_sphere => @prescription.od_sphere,
				:od_cylinder => @prescription.od_cylinder,
				:od_axis => @prescription.od_axis,
				:od_base_curve => @prescription.od_base_curve,
				:od_diameter => @prescription.od_diameter,
				:od_brand_id => @prescription.od_brand_id,
				:os_sphere => @prescription.os_sphere,
				:os_cylinder => @prescription.os_cylinder,
				:os_axis => @prescription.os_axis,
				:os_base_curve => @prescription.os_base_curve,
				:os_diameter => @prescription.os_diameter,
				:os_brand_id => @prescription.os_brand_id,
				})
		end
	end
	
	def show
	end
	
	def update
		if @dispensing.update_attributes(params[:contacts_prescription]) then
			flash[:success] = "Contacts dispensing has been updated."
			redirect_to invoice_contacts_dispensing_path(@current_account, @invoice, @dispensing)
		else
			render "edit"
		end
	end
	
	private
	def find_invoice
		@invoice = @current_account.invoices.find(params[:invoice_id])
		add_breadcrumb '#' + @invoice.id.to_s, invoice_path(@current_account, @invoice)
		add_breadcrumb "Contacts Dispensing", invoice_contacts_dispensing_index_path(@current_account, @invoice)
	end

	def find_dispensing
		@dispensing = @invoice.contacts_dispensing.find(params[:id])
		add_breadcrumb @dispensing.rx_date, invoice_contacts_dispensing_path(@current_account, @invoice, @dispensing)
	end

	def find_brands
		@brands = @current_account.brands
	end
	
	def navbar
	  @navbar_selected = 'invoices'
	end
end
