class GlassesPrescriptionsController < ApplicationController
	add_breadcrumb "Patients", :patients_path

	before_filter :find_patient
	before_filter :find_glasses_prescription, :only => [:edit, :show, :update]
	authorize_resource	
	
	def index
		@glasses_prescriptions = @patient.glasses_prescriptions.page(params[:page])
	end
	
	def create
		add_breadcrumb "New", new_patient_glasses_prescription_path(@current_account, @patient)

		@glasses_prescription = @patient.glasses_prescriptions.build(params[:glasses_prescription])
		@glasses_prescription.account_id = @current_account.id
		if @glasses_prescription.save then
			flash[:success] = "Glasses prescription has been created."
			redirect_to patient_glasses_prescription_path(@current_account, @patient, @glasses_prescription)
		else
			render "new"
		end
	end
	
	def edit
		redirect_to :action => 'show'
	end
	
	def new
		add_breadcrumb "New", new_patient_glasses_prescription_path(@current_account, @patient)
		
		@glasses_prescription = @patient.glasses_prescriptions.build
	end
	
	def show
	end
	
	def update
		if @glasses_prescription.update_attributes(params[:glasses_prescription]) then
			flash[:success] = "Glasses prescription has been updated."
			redirect_to patient_glasses_prescription_path(@current_account, @patient, @glasses_prescription)
		else
			render "new"
		end
	end

	def current
		@glasses_prescription = @patient.glasses_prescriptions.order(:rx_date).first()
		
		if @glasses_prescription == nil then
			redirect_to new_patient_glasses_prescription_path(@current_account, @patient)
		else
			redirect_to edit_patient_glasses_prescription_path(@current_account, @patient, @glasses_prescription)
		end
	end
	
	private
	def find_patient
		@patient = @current_account.patients.find(params[:patient_id])
		add_breadcrumb @patient, patient_path(@current_account, @patient)
		add_breadcrumb "Glasses Prescriptions", patient_glasses_prescriptions_path(@current_account, @patient)
	end

	def find_glasses_prescription
		@glasses_prescription = @patient.glasses_prescriptions.find(params[:id])
		add_breadcrumb @glasses_prescription.rx_date, patient_glasses_prescription_path(@current_account, @patient, @glasses_prescription)
	end

	def navbar
	  @navbar_selected = 'patients'
	end
end
