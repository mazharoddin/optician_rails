class Admin::LensTypesController < Admin::ApplicationController
	add_breadcrumb "Lens Types", :admin_lens_types_path

	before_filter :find_lens_type, :only => [:edit, :show, :update]
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_lens_types_path
			@lens_types = @current_account.lens_types.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@lens_types = @current_account.lens_types.order(:name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_lens_type_path

		@lens_type = @current_account.lens_types.build(params[:lens_type])
		if @lens_type.save then
			flash[:success] = "Lens type has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_admin_lens_type_path(@lens_type)
	end
	
	def new
		add_breadcrumb "New", new_admin_lens_type_path

		@lens_type = @current_account.lens_types.build
	end
	
	def show
	end
	
	def update
		if @lens_type.update_attributes(params[:lens_type]) then
			flash[:success] = "Lens type has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_lens_type
		@lens_type = @current_account.lens_types.find(params[:id])
		add_breadcrumb @lens_type.name, admin_lens_type_path(@lens_type)
	end
end
