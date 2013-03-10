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
		@dispensing.account_id = @current_account.id
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
		
		@prescription = @invoice.patient.glasses_prescriptions.order(:rx_date).first()
		if @prescription == nil
			@dispensing = @invoice.glasses_dispensing.build
		else
			@dispensing = @invoice.glasses_dispensing.build({
				:description => @prescription.description,
				:rx_date => @prescription.rx_date,
				:expiry_date => @prescription.expiry_date,
				:optometrist_id => @prescription.optometrist_id,
				:notes => @prescription.notes,
				:od_sphere => @prescription.od_sphere,
				:od_cylinder => @prescription.od_cylinder,
				:od_axis => @prescription.od_axis,
				:od_add => @prescription.od_add,
				:od_prism1 => @prescription.od_prism1,
				:od_base1 => @prescription.od_base1,
				:od_prism2 => @prescription.od_prism2,
				:od_base2 => @prescription.od_base2,
				:os_sphere => @prescription.os_sphere,
				:os_cylinder => @prescription.os_cylinder,
				:os_axis => @prescription.os_axis,
				:os_add => @prescription.os_add,
				:os_prism1 => @prescription.os_prism1,
				:os_base1 => @prescription.os_base1,
				:os_prism2 => @prescription.os_prism2,
				:os_base2 => @prescription.os_base2
				})
		end
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
		add_breadcrumb "Glasses Dispensing", invoice_glasses_dispensing_index_path(@current_account, @invoice)
	end

	def find_dispensing
		@dispensing = @invoice.glasses_dispensing.find(params[:id])
		add_breadcrumb @dispensing.rx_date, invoice_glasses_dispensing_path(@current_account, @invoice, @dispensing)
	end

	def navbar
	  @navbar_selected = 'invoices'
	end
end
