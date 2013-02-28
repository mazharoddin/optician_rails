class Admin::OptometristsController < Admin::ApplicationController
	add_breadcrumb "Optometrists", :admin_optometrists_path

	before_filter :find_optometrist, :only => [:edit, :show, :update]
	authorize_resource	
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_optometrists_path
			@optometrists = @current_account.optometrists.where('first_name like ? or last_name like ?', '%' + params[:q] + '%', '%' + params[:q] + '%').order(:last_name).order(:first_name).page(params[:page])
		else
			@optometrists = @current_account.optometrists.order(:last_name).order(:first_name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", :new_admin_optometrist_path

		@optometrist = @current_account.optometrists.new(params[:optometrist])
		if @optometrist.save then
			flash[:success] = "Optometrist has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_admin_optometrist_path(@current_account, @optometrist)
	end
	
	def new
		add_breadcrumb "New", :new_admin_optometrist_path

		@optometrist = @current_account.optometrists.new
	end
	
	def show
	end
	
	def update
		if @optometrist.update_attributes(params[:optometrist]) then
			flash[:success] = "Optometrist has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_optometrist
		@optometrist = @current_account.optometrists.find(params[:id])
		add_breadcrumb @optometrist, admin_optometrist_path(@current_account, @optometrist)
	end
end
