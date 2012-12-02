Optician::Application.routes.draw do
  devise_for :employees do
    get "/login" => "devise/sessions#new"
	delete "/logout" => "devise/sessions#destroy"
  end

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
  resources :dashboard
  namespace :inventory do
	resources :contacts, :as => 'contacts_inventory'
	resources :frames, :as => 'frames_inventory'
	resources :lenses, :as => 'lenses_inventory'
	resources :services, :as => 'services_inventory'
	resources :other, :as => 'other_inventory'
	root :to => 'inventory#index'
    match ':id' => 'inventory#show'
  end
  resources :patients do
	resources :contacts_prescriptions do
		get 'current', :on => :collection
	end
    resources :glasses_prescriptions do
		get 'current', :on => :collection
	end
  end
  namespace :admin do
    resources :dashboard
    resources :brands
    resources :companies
	resources :countries do
	  resources :states
	end
	resources :employees
	resources :employment_types
	resources :genders
	resources :guardian_relationships
	resources :lens_materials
	resources :optometrists
	resources :personal_titles
	resources :stores
	resources :tax_classes
	resources :taxes
	root :to => 'dashboard#index'
  end
  
  root :to => 'dashboard#index'
end
