class Admin::LensCoatingsController < Admin::ApplicationController
	add_breadcrumb "Lens Coatings", :admin_lens_coatings_path

	before_filter :find_lens_coating, :only => [:edit, :show, :update]
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_lens_coatings_path
			@lens_coatings = @current_account.lens_coatings.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@lens_coatings = @current_account.lens_coatings.order(:name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_lens_coating_path

		@lens_coating = @current_account.lens_coatings.build(params[:lens_coating])
		if @lens_coating.save then
			flash[:success] = "Lens coating has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_admin_lens_coating_path(@lens_coating)
	end
	
	def new
		add_breadcrumb "New", new_admin_lens_coating_path

		@lens_coating = @current_account.lens_coatings.build
	end
	
	def show
	end
	
	def update
		if @lens_coating.update_attributes(params[:lens_coating]) then
			flash[:success] = "Lens coating has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_lens_coating
		@lens_coating = @current_account.lens_coatings.find(params[:id])
		add_breadcrumb @lens_coating.name, admin_lens_coating_path(@lens_coating)
	end
end
