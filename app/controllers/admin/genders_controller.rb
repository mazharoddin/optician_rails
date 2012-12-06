class Admin::GendersController < Admin::ApplicationController
	before_filter :find_gender, :only => [:edit, :show, :update]
	
	add_breadcrumb "Genders", :admin_genders_path

	def index
		@genders = Gender.order(:name).page(params[:page])
	end
	
	def create
		add_breadcrumb "New", new_admin_gender_path

		@gender = Gender.new(params[:gender])
		if @gender.save then
			flash[:success] = "Gender has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @gender.name, admin_gender_path(@gender)
		add_breadcrumb "Edit", edit_admin_gender_path(@gender)
	end
	
	def new
		add_breadcrumb "New", new_admin_gender_path

		@gender = Gender.new
	end
	
	def show
		add_breadcrumb @gender.name, admin_gender_path(@gender)
	end
	
	def update
		add_breadcrumb @gender.name, admin_gender_path(@gender)

		if @gender.update_attributes(params[:gender]) then
			flash[:success] = "Gender has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_gender
		@gender = Gender.find(params[:id])
	end
end
