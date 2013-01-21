class Admin::LensMaterialsController < Admin::ApplicationController
	add_breadcrumb "Lens Materials", :admin_lens_materials_path

	before_filter :find_lens_material, :only => [:edit, :show, :update]
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_lens_materials_path
			@lens_materials = @current_account.lens_materials.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@lens_materials = @current_account.lens_materials.order(:name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_lens_material_path

		@lens_material = @current_account.lens_materials.build(params[:lens_material])
		if @lens_material.save then
			flash[:success] = "Lens material has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_admin_lens_material_path(@lens_material)
	end
	
	def new
		add_breadcrumb "New", new_admin_lens_material_path

		@lens_material = @current_account.lens_materials.build
	end
	
	def show
	end
	
	def update
		if @lens_material.update_attributes(params[:lens_material]) then
			flash[:success] = "Lens material has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_lens_material
		@lens_material = @current_account.lens_materials.find(params[:id])
		add_breadcrumb @lens_material.name, admin_lens_material_path(@lens_material)
	end
end
