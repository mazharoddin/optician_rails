class Admin::PersonalTitlesController < Admin::ApplicationController
	add_breadcrumb "Personal Titles", :admin_personal_titles_path

	before_filter :find_personal_title, :only => [:edit, :show, :update]
	
	def index
		if params[:q] then
			add_breadcrumb "Search Results", :admin_personal_titles_path
			@personal_titles = @current_account.personal_titles.where('title like ?', '%' + params[:q] + '%').order(:title).page(params[:page])
		else
			@personal_titles = @current_account.personal_titles.order(:title).page(params[:page])
		end
	end
	
	def create
		add_breadcrumb "New", new_admin_personal_title_path

		@personal_title = @current_account.personal_titles.build(params[:personal_title])
		if @personal_title.save then
			flash[:success] = "Personal title has been created."
			redirect_to :action => 'index'
		else
			render "new"
		end
	end
	
	def edit
		add_breadcrumb "Edit", edit_admin_personal_title_path(@personal_title)
	end
	
	def new
		add_breadcrumb "New", new_admin_personal_title_path

		@personal_title = @current_account.personal_titles.build
	end
	
	def show
	end
	
	def update
		if @personal_title.update_attributes(params[:personal_title]) then
			flash[:success] = "Personal title has been updated."
			redirect_to :action => 'index'
		else
			render "edit"
		end
	end

	private
	def find_personal_title
		@personal_title = @current_account.personal_titles.find(params[:id])
		add_breadcrumb @personal_title.title, admin_personal_title_path(@personal_title)
	end
end
