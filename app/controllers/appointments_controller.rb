class AppointmentsController < ApplicationController
	add_breadcrumb "Appointments", :appointments_path

#	before_filter :find_patient
	before_filter :find_appointment, :only => [:edit, :show, :update]
	authorize_resource	
	
	def index
		@appointments = @current_account.appointments.page(params[:page])
	end
	
	def create
		add_breadcrumb "New", new_appointment_path(@current_account)

		@appointment = @current_account.appointments.build(params[:appointment])
		if @appointment.save then
			flash[:success] = "Appointment has been created."
			redirect_to appointment_path(@current_account, @appointment)
		else
			render "new"
		end
	end
	
	def edit
		redirect_to :action => 'show'
	end
	
	def new
		add_breadcrumb "New", new_appointment_path(@current_account)
		
		@appointment = @current_account.appointments.build
	end
	
	def show
	end
	
	def update
		if @appointment.update_attributes(params[:appointment]) then
			flash[:success] = "Appointment has been updated."
			redirect_to appointment_path(@current_account, @appointment)
		else
			render "new"
		end
	end

	private
#	def find_patient
#		@patient = @current_account.patients.find(params[:patient_id])
#		add_breadcrumb @patient, patient_path(@current_account, @patient)
#		add_breadcrumb "Glasses Prescriptions", patient_glasses_prescriptions_path(@current_account, @patient)
#	end

	def find_appointment
		@appointment = @current_account.appointments.find(params[:id])
		add_breadcrumb @appointment.patient.to_s + ' @ ' + @appointment.start_at.to_s, appointments_path(@current_account, @appointment)
	end

	def navbar
	  @navbar_selected = 'appointments'
	end
end
