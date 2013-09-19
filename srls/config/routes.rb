Srls::Application.routes.draw do
  
  match 'user_managers/delete/:id' => 'user_managers#delete'
  match 'user_managers/new' => 'user_managers#new'
  match 'user_managers/create' => 'user_managers#create'
  match 'user_managers/edit/:id' => 'user_managers#edit'
  match 'user_managers/changeRole/:id' => 'user_managers#changeRole'
  match 'user_managers/edit_password/:id' => 'user_managers#edit_password'
  match 'user_managers/change_password/:id' => 'user_managers#change_password'
  #match 'user_logs' => 'user_logs#index'
  
  resources :user_managers
  resources :change_logs
  devise_for :user_logs, :methods => { :index => "user_logs/index" }
  resources :marriege_items
  resources :death_record_items
  resources :marriege_books
  resources :death_record_books
  resources :baptism_items
  resources :baptism_books
  resources :confirmation_items
  resources :confirmation_books
  resources :churches
  devise_for :users, :controllers => { :sessions => "user_logs" }
  
  root :to => 'user_managers#home'

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
end
