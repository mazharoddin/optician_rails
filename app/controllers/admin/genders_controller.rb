class Admin::GendersController < Admin::ApplicationController
	add_breadcrumb "Genders", :admin_genders_path

	before_filter :find_gender, :only => [:edit, :show, :update]
	authorize_resource
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_genders_path
			@genders = Gender.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@genders = Gender.order(:name).page(params[:page])
		end
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
		add_breadcrumb "Edit", edit_admin_gender_path(@gender)
	end
	
	def new
		add_breadcrumb "New", new_admin_gender_path

		@gender = Gender.new
	end
	
	def show
	end
	
	def update
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
		add_breadcrumb @gender.name, admin_gender_path(@gender)
	end
end
