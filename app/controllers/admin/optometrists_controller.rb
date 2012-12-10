class Admin::OptometristsController < Admin::ApplicationController
	before_filter :find_optometrist, :only => [:edit, :show, :update]
	
	add_breadcrumb "Optometrists", :admin_optometrists_path

	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_optometrists_path
			@optometrists = Optometrist.where('first_name like ? or last_name like ?', '%' + params[:q] + '%', '%' + params[:q] + '%').order(:last_name).order(:first_name).page(params[:page])
		else
			@optometrists = Optometrist.order(:last_name).order(:first_name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_optometrist_path

		@optometrist = Optometrist.new(params[:optometrist])
		if @optometrist.save then
			flash[:success] = "Optometrist has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @optometrist.full_name, admin_optometrist_path(@optometrist)
		add_breadcrumb "Edit", edit_admin_optometrist_path(@optometrist)
	end
	
	def new
		add_breadcrumb "New", new_admin_optometrist_path

		@optometrist = Optometrist.new
	end
	
	def show
		add_breadcrumb @optometrist.full_name, admin_optometrist_path(@optometrist)
	end
	
	def update
		add_breadcrumb @optometrist.full_name, admin_optometrist_path(@optometrist)

		if @optometrist.update_attributes(params[:optometrist]) then
			flash[:success] = "Optometrist has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_optometrist
		@optometrist = Optometrist.find(params[:id])
	end
end
