class PatientsController < ApplicationController
	before_filter :find_patient, :only => [:edit, :show, :update, :dispensing, :invoices]
	
	add_breadcrumb "Patients", :patients_path

	def index
		if params[:q] then
			add_breadcrumb "Search Results", :patients_path
			@patients = @current_account.patients.where('last_name like ? or first_name like ?', '%' + params[:q] + '%', '%' + params[:q] + '%').order(:last_name).order(:first_name).page(params[:page])
		else
			@patients = @current_account.patients.order(:last_name).order(:first_name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_patient_path

		@patient = @current_account.patients.build(params[:patient])
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

		@patient = @current_account.patients.build
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

	def dispensing
		add_breadcrumb @patient.full_name, patient_path(@patient)
		add_breadcrumb 'Dispensing', patient_dispensing_path(@patient)
		
		@dispensing = @patient.dispensing.page(params[:page])
	end
	
	def invoices
		add_breadcrumb @patient.full_name, patient_path(@patient)
		add_breadcrumb 'Invoices', patient_invoices_path(@patient)
		
		@invoices = @patient.invoices.page(params[:page])
	end
	
	private
	def find_patient
	    if params[:patient_id] != nil then
			@patient = @current_account.patients.find(params[:patient_id])
		else
			@patient = @current_account.patients.find(params[:id])
		end
	end

	def navbar
	  @navbar_selected = 'patients'
	end
end
