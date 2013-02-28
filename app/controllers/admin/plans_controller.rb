class Admin::PlansController < Admin::ApplicationController
	add_breadcrumb "Plans", :admin_plans_path

	before_filter :find_plan, :only => [:edit, :show, :update]
	authorize_resource	
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_plans_path
			@plans = Plan.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@plans = Plan.order(:name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", :new_admin_plan_path

		@plan = Plan.new(params[:plan])
		if @plan.save then
			flash[:success] = "Plan has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_admin_plan_path(@current_account, @plan)
	end
	
	def new
		add_breadcrumb "New", :new_admin_plan_path

		@plan = Plan.new
	end
	
	def show
	end
	
	def update
		if @plan.update_attributes(params[:plan]) then
			flash[:success] = "Plan has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_plan
		@plan = Plan.find(params[:id])
		add_breadcrumb @plan.name, admin_plan_path(@current_account, @plan)
	end
end
