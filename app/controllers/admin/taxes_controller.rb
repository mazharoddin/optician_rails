class Admin::TaxesController < Admin::ApplicationController
	before_filter :find_tax, :only => [:edit, :show, :update]
	
	add_breadcrumb "Taxes", :admin_taxes_path

	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_taxes_path
			@taxes = Tax.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@taxes = Tax.order(:name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_tax_path

		@tax = Tax.new(params[:tax])
		if @tax.save then
			flash[:success] = "Tax has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @tax.name, admin_tax_path(@tax)
		add_breadcrumb "Edit", edit_admin_tax_path(@tax)
	end
	
	def new
		add_breadcrumb "New", new_admin_tax_path

		@tax = Tax.new
	end
	
	def show
		add_breadcrumb @tax.name, admin_tax_path(@tax)
	end
	
	def update
		add_breadcrumb @tax.name, admin_tax_path(@tax)

		if @tax.update_attributes(params[:tax]) then
			flash[:success] = "Tax has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_tax
		@tax = Tax.find(params[:id])
	end
end
