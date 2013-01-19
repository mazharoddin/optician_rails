class Admin::BrandsController < Admin::ApplicationController
	before_filter :find_brand, :only => [:edit, :show, :update]
	
	add_breadcrumb "Brands", :admin_brands_path

	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_brands_path
			@brands = @current_account.brands.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@brands = @current_account.brands.order(:name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_brand_path

		@brand = @current_account.brands.build(params[:brand])
		if @brand.save then
			flash[:success] = "Brand has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @brand.name, admin_brand_path(@brand)
		add_breadcrumb "Edit", edit_admin_brand_path(@brand)
	end
	
	def new
		add_breadcrumb "New", new_admin_brand_path

		@brand = @current_account.brands.build
	end
	
	def show
		add_breadcrumb @brand.name, admin_brand_path(@brand)
	end
	
	def update
		add_breadcrumb @brand.name, admin_brand_path(@brand)

		if @brand.update_attributes(params[:brand]) then
			flash[:success] = "Brand has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_brand
		@brand = @current_account.brands.find(params[:id])
	end
end
