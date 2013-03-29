Optician::Application.routes.draw do
	get "registration" => 'registration#new'
	post "registration" => 'registration#create'

	devise_for :users

	# The priority is based upon order of creation:
	# first created -> highest priority.

	# Sample of regular route:
	#   match 'products/:id' => 'catalog#view'
	# Keep in mind you can assign values other than :controller and :action

	# Sample of named route:
	#   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
	# This route can be invoked with purchase_url(:id => product.id)

	# Sample resource route (maps HTTP verbs to controller actions automatically):
	#   resources :products

	# Sample resource route with options:
	#   resources :products do
	#     member do
	#       get 'short'
	#       post 'toggle'
	#     end
	#
	#     collection do
	#       get 'sold'
	#     end
	#   end

	# Sample resource route with sub-resources:
	#   resources :products do
	#     resources :comments, :sales
	#     resource :seller
	#   end

	# Sample resource route with more complex sub-resources
	#   resources :products do
	#     resources :comments
	#     resources :sales do
	#       get 'recent', :on => :collection
	#     end
	#   end

	# Sample resource route within a namespace:
	#   namespace :admin do
	#     # Directs /admin/products/* to Admin::ProductsController
	#     # (app/controllers/admin/products_controller.rb)
	#     resources :products
	#   end

	# You can have the root of your site routed with "root"
	# just remember to delete public/index.html.
	# root :to => 'welcome#index'

	# See how all your routes lay out with "rake routes"

	# This is a legacy wild controller route that's not recommended for RESTful applications.
	# Note: This route will make all actions in every controller accessible via GET requests.
	# match ':controller(/:action(/:id))(.:format)'
	scope ':subdomain' do
		resources :appointments
		resources :invoices do
			get 'patients'
			put 'patients/:id', :action => 'set_patient', :as => 'set_patient'
			put 'cash_sale', :action => 'set_cash_sale'
			put 'void', :action => 'void_invoice'
			resources :items do
				get 'accessories', :action => 'accessories', :on => :collection
				get 'services', :action => 'services', :on => :collection
			end
			resources :contacts, :as => 'contacts_dispensing', :controller => 'contacts_dispensing'
			resources :glasses, :as => 'glasses_dispensing', :controller => 'glasses_dispensing'
			#resources :accessories, :controller => 'invoices/accessories'
			#resources :contacts, :controller => 'invoices/contacts'
			#resources :glasses, :controller => 'invoices/glasses'
			#resources :other, :controller => 'invoices/other', :as => 'invoice_items'
			#resources :services, :controller => 'invoices/services'
		end
		namespace :inventory do
			resources :contacts, :as => 'contacts_inventory'
			resources :frames, :as => 'frames_inventory'
			resources :lenses, :as => 'lens_inventory'
			resources :services, :as => 'services_inventory'
			resources :accessories, :as => 'accessories_inventory'
			root :to => 'inventory#index'
			match ':id' => 'inventory#show'
		end
		resources :patients do
			get 'dispensing'
			get 'invoices'
			resources :contacts_prescriptions do
				get 'current', :on => :collection
			end
			resources :glasses_prescriptions do
				get 'current', :on => :collection
			end
		end
		namespace :admin do
			resources :accounts
			resources :brands
			resources :companies
			resources :countries do
				resources :states
			end
			resources :employees
			resources :employment_types
			resources :genders
			resources :guardian_relationships
			resources :lens_coatings
			resources :lens_materials
			resources :lens_types
			resources :optometrists
			resources :payment_methods
			resources :personal_titles
			resources :plans
			resources :locations
			resources :taxes
			root :to => 'dashboard#index'
		end
		
		root :to => 'dashboard#index', :as => 'dashboard'
	end
	root :to => 'dashboard#home'
end
