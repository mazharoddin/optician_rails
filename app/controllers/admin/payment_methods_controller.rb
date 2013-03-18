class Admin::PaymentMethodsController < Admin::ApplicationController
	add_breadcrumb "Payment Methods", :admin_payment_methods_path

	before_filter :find_payment_method, :only => [:edit, :show, :update]
	authorize_resource	
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_payment_methods_path
			@payment_methods = @current_account.payment_methods.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@payment_methods = @current_account.payment_methods.order(:name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", :new_admin_payment_method_path

		@payment_method = @current_account.payment_methods.build(params[:payment_method])
		if @payment_method.save then
			flash[:success] = "Payment method has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_admin_payment_method_path(@current_account, @payment_method)
	end
	
	def new
		add_breadcrumb "New", :new_admin_payment_method_path

		@payment_method = @current_account.payment_methods.build
	end
	
	def show
	end
	
	def update
		if @payment_method.update_attributes(params[:payment_method]) then
			flash[:success] = "Payment method has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_payment_method
		@payment_method = @current_account.payment_methods.find(params[:id])
		add_breadcrumb @payment_method.name, admin_payment_method_path(@current_account, @payment_method)
	end
end
