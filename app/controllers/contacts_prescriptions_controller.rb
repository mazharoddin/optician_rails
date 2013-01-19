class ContactsPrescriptionsController < ApplicationController
	before_filter :find_patient
	before_filter :find_contacts_prescription, :only => [:edit, :show, :update]
	
	add_breadcrumb "Patients", :patients_path
	
	def index
		add_breadcrumb @patient.full_name, patient_path(@patient)
		add_breadcrumb "Contacts Prescriptions", patient_contacts_prescriptions_path(@patient)

		@contacts_prescriptions = @patient.contacts_prescriptions.page(params[:page])
	end
	
	def create
		add_breadcrumb @patient.full_name, patient_path(@patient)
		add_breadcrumb "Contacts Prescriptions", patient_contacts_prescriptions_path(@patient)
		add_breadcrumb "New", new_patient_contacts_prescription_path(@patient)

		@contacts_prescription = @patient.contacts_prescriptions.build(params[:contacts_prescription])
		if @contacts_prescription.save then
			flash[:success] = "Contacts prescription has been created."
			redirect_to patient_contacts_prescription_path(@patient, @contacts_prescription)
		else
			render "new"
		end
	end
	
	def edit
		redirect_to :action => 'show'
	end
	
	def new
		add_breadcrumb @patient.full_name, patient_path(@patient)
		add_breadcrumb "Contacts Prescriptions", patient_contacts_prescriptions_path(@patient)
		add_breadcrumb "New", new_patient_contacts_prescription_path(@patient)
		
		@contacts_prescription = @patient.contacts_prescriptions.build
	end
	
	def show
		add_breadcrumb @patient.full_name, patient_path(@patient)
		add_breadcrumb "Contacts Prescriptions", patient_contacts_prescriptions_path(@patient)
		add_breadcrumb @contacts_prescription.rx_date, patient_contacts_prescription_path(@patient, @contacts_prescription)
	end
	
	def update
		add_breadcrumb @patient.full_name, patient_path(@patient)
		add_breadcrumb "Contacts Prescriptions", patient_contacts_prescriptions_path(@patient)
		add_breadcrumb @contacts_prescription.rx_date, patient_contacts_prescription_path(@patient, @contacts_prescription)

		if @contacts_prescription.update_attributes(params[:contacts_prescription]) then
			flash[:success] = "Contacts prescription has been updated."
			redirect_to patient_contacts_prescription_path(@patient, @contacts_prescription)
		else
			render "edit"
		end
	end

	def current
		@contacts_prescription = @patient.contacts_prescriptions.order(:rx_date).first()
		
		if @contacts_prescription == nil then
			redirect_to new_patient_contacts_prescription_path(@patient)
		else
			redirect_to edit_patient_contacts_prescription_path(@patient, @contacts_prescription)
		end
	end
	
	private
	def find_patient
		@patient = @current_account.patients.find(params[:patient_id])
	end

	def find_contacts_prescription
		@contacts_prescription = @patient.contacts_prescriptions.find(params[:id])
	end

	def navbar
	  @navbar_selected = 'patients'
	end
end
