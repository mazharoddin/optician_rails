class ContactsPrescriptionsController < ApplicationController
	add_breadcrumb "Patients", :patients_path

	before_filter :find_patient
	before_filter :find_contacts_prescription, :only => [:edit, :show, :update]
	before_filter :find_brands, :only => [:create, :edit, :new, :show, :update]
	authorize_resource	
	
	def index
		@contacts_prescriptions = @patient.contacts_prescriptions.page(params[:page])
	end
	
	def create
		add_breadcrumb "New", new_patient_contacts_prescription_path(@current_account, @patient)

		@contacts_prescription = @patient.contacts_prescriptions.build(params[:contacts_prescription])
		@contacts_prescription.account_id = @current_account.id
		if @contacts_prescription.save then
			flash[:success] = "Contacts prescription has been created."
			redirect_to patient_contacts_prescription_path(@current_account, @patient, @contacts_prescription)
		else
			render "new"
		end
	end
	
	def edit
		redirect_to :action => 'show'
	end
	
	def new
		add_breadcrumb "New", new_patient_contacts_prescription_path(@current_account, @patient)
		
		@contacts_prescription = @patient.contacts_prescriptions.build
	end
	
	def show
	end
	
	def update
		if @contacts_prescription.update_attributes(params[:contacts_prescription]) then
			flash[:success] = "Contacts prescription has been updated."
			redirect_to patient_contacts_prescription_path(@current_account, @patient, @contacts_prescription)
		else
			render "new"
		end
	end

	def current
		@contacts_prescription = @patient.contacts_prescriptions.order(:rx_date).first()
		
		if @contacts_prescription == nil then
			redirect_to new_patient_contacts_prescription_path(@current_account, @patient)
		else
			redirect_to edit_patient_contacts_prescription_path(@current_account, @patient, @contacts_prescription)
		end
	end
	
	private
	def find_patient
		@patient = @current_account.patients.find(params[:patient_id])
		add_breadcrumb @patient, patient_path(@current_account, @patient)
		add_breadcrumb "Contacts Prescriptions", patient_contacts_prescriptions_path(@current_account, @patient)
	end

	def find_contacts_prescription
		@contacts_prescription = @patient.contacts_prescriptions.find(params[:id])
		add_breadcrumb @contacts_prescription.rx_date, patient_contacts_prescription_path(@current_account, @patient, @contacts_prescription)
	end

	def find_brands
		@brands = @current_account.brands
	end
	
	def navbar
	  @navbar_selected = 'patients'
	end
end
