class Admin::TaxClassesController < Admin::ApplicationController
	before_filter :find_tax_class, :only => [:edit, :show, :update]
	
	add_breadcrumb "Tax Classes", :admin_taxes_path

	def index
		@tax_classes = TaxClass.order(:name).page(params[:page])
	end
	
	def create
		add_breadcrumb "Tax Class", new_admin_tax_class_path

		@tax_class = TaxClass.new(params[:tax_class])
		if @tax_class.save then
			flash[:success] = "Tax class has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @tax_class.name, admin_tax_class_path(@tax_class)
		add_breadcrumb "Edit", edit_admin_tax_class_path(@tax_class)
	end
	
	def new
		add_breadcrumb "New", new_admin_tax_class_path

		@tax_class = TaxClass.new
	end
	
	def show
		add_breadcrumb @tax_class.name, admin_tax_class_path(@tax_class)
	end
	
	def update
		add_breadcrumb @tax_class.name, admin_tax_class_path(@tax_class)

		if @tax_class.update_attributes(params[:tax_class]) then
			flash[:success] = "Tax class has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_tax_class
		@tax_class = TaxClass.find(params[:id])
	end
end
