class Admin::LensCoatingsController < Admin::ApplicationController
	before_filter :find_lens_coating, :only => [:edit, :show, :update]
	
	add_breadcrumb "Lens Coatings", :admin_lens_coatings_path

	def index
		@lens_coatings = LensCoating.order(:name).page(params[:page])
	end
	
	def create
		add_breadcrumb "Lens Coating", new_admin_lens_coating_path

		@lens_coating = LensCoating.new(params[:lens_coating])
		if @lens_coating.save then
			flash[:success] = "Lens coating has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @lens_coating.name, admin_lens_coating_path(@lens_coating)
		add_breadcrumb "Edit", edit_admin_lens_coating_path(@lens_coating)
	end
	
	def new
		add_breadcrumb "New", new_admin_lens_coating_path

		@lens_coating = LensCoating.new
	end
	
	def show
		add_breadcrumb @lens_coating.name, admin_lens_coating_path(@lens_coating)
	end
	
	def update
		add_breadcrumb @lens_coating.name, admin_lens_coating_path(@lens_coating)

		if @lens_coating.update_attributes(params[:lens_coating]) then
			flash[:success] = "Lens coating has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_lens_coating
		@lens_coating = LensCoating.find(params[:id])
	end
end
