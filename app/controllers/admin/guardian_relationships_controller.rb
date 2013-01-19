class Admin::GuardianRelationshipsController < Admin::ApplicationController
	before_filter :find_guardian_relationship, :only => [:edit, :show, :update]
	
	add_breadcrumb "Guardian Relationships", :admin_guardian_relationships_path

	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_guardian_relationships_path
			@guardian_relationships = @current_account.guardian_relationships.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@guardian_relationships = @current_account.guardian_relationships.order(:name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_guardian_relationship_path

		@guardian_relationship = @current_account.guardian_relationships.build(params[:guardian_relationship])
		if @guardian_relationship.save then
			flash[:success] = "Guardian relationship has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @guardian_relationship.name, admin_guardian_relationship_path(@guardian_relationship)
		add_breadcrumb "Edit", edit_admin_guardian_relationship_path(@guardian_relationship)
	end
	
	def new
		add_breadcrumb "New", new_admin_guardian_relationship_path

		@guardian_relationship = @current_account.guardian_relationships.build
	end
	
	def show
		add_breadcrumb @guardian_relationship.name, admin_guardian_relationship_path(@guardian_relationship)
	end
	
	def update
		add_breadcrumb @guardian_relationship.name, admin_guardian_relationship_path(@guardian_relationship)

		if @guardian_relationship.update_attributes(params[:guardian_relationship]) then
			flash[:success] = "Guardian relationship has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_guardian_relationship
		@guardian_relationship = @current_account.guardian_relationships.find(params[:id])
	end
end
