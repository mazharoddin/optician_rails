class PatientsController < ApplicationController
	before_filter :find_patient, :only => [:edit, :show, :update]
	
	add_breadcrumb "Patients", :patients_path

	def index
		@patients = Patient.order(:last_name).order(:first_name).page(params[:page])
	end
	
	def create
		add_breadcrumb "Patient", new_patient_path

		@patient = Patient.new(params[:patient])
		if @patient.save then
			flash[:success] = "Patient has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		redirect_to :action => 'show'
	end
	
	def new
		add_breadcrumb "New", new_patient_path

		@patient = Patient.new
	end
	
	def show
		add_breadcrumb @patient.full_name, patient_path(@patient)
	end
	
	def update
		add_breadcrumb @patient.full_name, patient_path(@patient)

		if @patient.update_attributes(params[:patient]) then
			flash[:success] = "Patient has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_patient
		@patient = Patient.find(params[:id])
	end

	def navbar
	  @navbar_selected = 'patients'
	end
end
