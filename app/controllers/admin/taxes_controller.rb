class Admin::TaxesController < Admin::ApplicationController
	add_breadcrumb "Taxes", :admin_taxes_path

	before_filter :find_tax, :only => [:edit, :show, :update]
	authorize_resource	
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_taxes_path
			@taxes = @current_account.taxes.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@taxes = @current_account.taxes.order(:name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_tax_path

		@tax = @current_account.taxes.build(params[:tax])
		if @tax.save then
			flash[:success] = "Tax has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_admin_tax_path(@tax)
	end
	
	def new
		add_breadcrumb "New", new_admin_tax_path

		@tax = @current_account.taxes.build
	end
	
	def show
	end
	
	def update
		if @tax.update_attributes(params[:tax]) then
			flash[:success] = "Tax has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_tax
		@tax = @current_account.taxes.find(params[:id])
		add_breadcrumb @tax.name, admin_tax_path(@tax)
	end
end
