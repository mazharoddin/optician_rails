class Admin::GuardianRelationshipsController < Admin::ApplicationController
	add_breadcrumb "Guardian Relationships", :admin_guardian_relationships_path

	before_filter :find_guardian_relationship, :only => [:edit, :show, :update]
	authorize_resource	
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_guardian_relationships_path
			@guardian_relationships = GuardianRelationship.where('name like ?', '%' + params[:q] + '%').order(:name).page(params[:page])
		else
			@guardian_relationships = GuardianRelationship.order(:name).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_guardian_relationship_path

		@guardian_relationship = GuardianRelationship.new(params[:guardian_relationship])
		if @guardian_relationship.save then
			flash[:success] = "Guardian relationship has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_admin_guardian_relationship_path(@guardian_relationship)
	end
	
	def new
		add_breadcrumb "New", new_admin_guardian_relationship_path

		@guardian_relationship = GuardianRelationship.new
	end
	
	def show
	end
	
	def update
		if @guardian_relationship.update_attributes(params[:guardian_relationship]) then
			flash[:success] = "Guardian relationship has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_guardian_relationship
		@guardian_relationship = GuardianRelationship.find(params[:id])
		add_breadcrumb @guardian_relationship.name, admin_guardian_relationship_path(@guardian_relationship)
	end
end
