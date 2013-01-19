class Admin::GendersController < Admin::ApplicationController
	before_filter :find_gender, :only => [:edit, :show, :update]
	
	add_breadcrumb "Genders", :admin_genders_path

	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_genders_path
			@genders = @current_account.genders.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@genders = @current_account.genders.order(:name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_gender_path

		@gender = @current_account.genders.build(params[:gender])
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

		@gender = @current_account.genders.build
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
		@gender = @current_account.genders.find(params[:id])
	end
end
