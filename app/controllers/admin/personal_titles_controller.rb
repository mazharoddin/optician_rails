class Admin::PersonalTitlesController < Admin::ApplicationController
	before_filter :find_personal_title, :only => [:edit, :show, :update]
	
	add_breadcrumb "Personal Titles", :admin_personal_titles_path

	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_personal_titles_path
			@personal_titles = PersonalTitle.where('title like ?', '%' + params[:q] + '%').order(:title).page(params[:page])
		else
			@personal_titles = PersonalTitle.order(:title).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_personal_title_path

		@personal_title = PersonalTitle.new(params[:personal_title])
		if @personal_title.save then
			flash[:success] = "Personal title has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb @personal_title.title, admin_personal_title_path(@personal_title)
		add_breadcrumb "Edit", edit_admin_personal_title_path(@personal_title)
	end
	
	def new
		add_breadcrumb "New", new_admin_personal_title_path

		@personal_title = PersonalTitle.new
	end
	
	def show
		add_breadcrumb @personal_title.title, admin_personal_title_path(@personal_title)
	end
	
	def update
		add_breadcrumb @personal_title.title, admin_personal_title_path(@personal_title)

		if @personal_title.update_attributes(params[:personal_title]) then
			flash[:success] = "Personal title has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_personal_title
		@personal_title = PersonalTitle.find(params[:id])
	end
end
