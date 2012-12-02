class Admin::LensMaterialsController < Admin::ApplicationController
	before_filter :find_lens_material, :only => [:edit, :show, :update]
	
	add_breadcrumb "Lens Materials", :admin_lens_materials_path

	def index
		@lens_materials = LensMaterial.order(:name).page(params[:page])
	end
	
	def create
		add_breadcrumb "Lens Material", new_admin_lens_material_path

		@lens_material = LensMaterial.new(params[:lens_material])
		if @lens_material.save then
			flash[:success] = "Lens material has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @lens_material.name, admin_lens_material_path(@lens_material)
		add_breadcrumb "Edit", edit_admin_lens_material_path(@lens_material)
	end
	
	def new
		add_breadcrumb "New", new_admin_lens_material_path

		@lens_material = LensMaterial.new
	end
	
	def show
		add_breadcrumb @lens_material.name, admin_lens_material_path(@lens_material)
	end
	
	def update
		add_breadcrumb @lens_material.name, admin_lens_material_path(@lens_material)

		if @lens_material.update_attributes(params[:lens_material]) then
			flash[:success] = "Lens material has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_lens_material
		@lens_material = LensMaterial.find(params[:id])
	end
end
