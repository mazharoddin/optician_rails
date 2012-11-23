class SpectaclesPrescriptionsController < ApplicationController
	before_filter :find_patient
	before_filter :find_spectacles_prescription, :only => [:edit, :show, :update]
	
	add_breadcrumb "Patients", :patients_path
	
	def index
		add_breadcrumb @patient.full_name, patient_path(@patient)
		add_breadcrumb "Spectacles Prescriptions", patient_spectacles_prescriptions_path(@patient)

		@spectacles_prescriptions = @patient.spectacles_prescriptions.page(params[:page])
	end
	
	def create
		add_breadcrumb @patient.full_name, patient_path(@patient)
		add_breadcrumb "Spectacles Prescriptions", patient_spectacles_prescriptions_path(@patient)
		add_breadcrumb "New", new_patient_spectacle_prescription_path(@patient)

		@spectacles_prescription = @patient.spectacles_prescriptions.build(params[:spectacles_prescription])
		if @spectacles_prescription.save then
			flash[:success] = "Spectacles prescription has been created."
			redirect_to patient_path(@patient)
		else
			render "new"
		end
	end
	
	def edit
		redirect_to :action => 'show'
	end
	
	def new
		add_breadcrumb @patient.full_name, patient_path(@patient)
		add_breadcrumb "Spectacles Prescriptions", patient_spectacles_prescriptions_path(@patient)
		add_breadcrumb "New", new_patient_spectacles_prescription_path(@patient)
		
		@spectacles_prescription = @patient.spectacles_prescriptions.build
	end
	
	def show
		add_breadcrumb @patient.full_name, patient_path(@patient)
		add_breadcrumb "Spectacles Prescriptions", patient_spectacles_prescriptions_path(@patient)
		add_breadcrumb @spectacles_prescription.rx_date, patient_spectacles_prescription_path(@patient, @spectacles_prescription)
	end
	
	def update
		add_breadcrumb @patient.full_name, patient_path(@patient)
		add_breadcrumb "Spectacles Prescriptions", patient_spectacles_prescriptions_path(@patient)
		add_breadcrumb @spectacles_prescription.rx_date, patient_spectacles_prescription_path(@patient, @spectacles_prescription)

		if @spectacles_prescription.update_attributes(params[:spectacles_prescription]) then
			flash[:success] = "Spectacles prescription has been updated."
			redirect_to patient_spectacles_prescription_path(@patient, @spectacles_prescription)
		else
			render "edit"
		end
	end

	def current
		@spectacles_prescription = @patient.spectacles_prescriptions.order(:rx_date).first()
		
		if @spectacles_prescription == nil then
			redirect_to new_patient_spectacles_prescription_path(@patient)
		else
			redirect_to edit_patient_spectacles_prescription_path(@patient, @spectacles_prescription)
		end
	end
	
	private
	def find_patient
		@patient = Patient.find(params[:patient_id])
	end

	def find_spectacles_prescription
		@spectacles_prescription = @patient.spectacles_prescriptions.find(params[:id])
	end
end
