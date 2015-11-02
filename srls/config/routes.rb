Srls::Application.routes.draw do

  root :to => 'user_managers#home'

  get 'user_managers/delete/:id' => 'user_managers#delete' 
  get 'user_managers/new' => 'user_managers#new'
  get 'user_managers/create' => 'user_managers#create'
  get 'user_managers/edit/:id' => 'user_managers#edit'
  get 'user_managers/changeRole/:id' => 'user_managers#changeRole'
  get 'user_managers/edit_password/:id' => 'user_managers#edit_password'
  get 'user_managers/change_password/:id' => 'user_managers#change_password'
  get 'user_managers/search' => 'user_managers#search'
  
  get 'user_logs/cerrar_sesion' => 'user_logs#cerrar_sesion'
  get 'user_logs/user_logs_index/:id' => 'user_logs#user_logs_index'
  get 'user_logs/changes_index' => 'user_logs#changes_index'
  get 'user_logs/user_changes_index/:id' => 'user_logs#user_changes_index'
  get 'user_logs/show_change_information/:id' => 'user_logs#show_change_information'

  get 'confirmation_items/:id' => 'confirmation_items#show'
  get 'confirmation_items/:id/edit' => 'confirmation_items#edit'

  get 'baptism_items/:id' => 'baptism_items#show'
  get 'baptism_items/:id/edit' => 'baptism_items#edit'

  get 'confirmation_books/search' => 'confirmation_books#search'
  get 'baptism_books/search' => 'baptism_books#search'
  get 'death_record_books/search' => 'death_record_books#search'
  get 'marriege_books/search' => 'marriege_books#search'

  get 'confirmation_books/searchName' => 'confirmation_books#searchName'
  get 'baptism_books/searchName' => 'baptism_books#searchName'
  get 'death_record_books/searchName' => 'death_record_books#searchName'
  get 'marriege_books/searchName' => 'marriege_books#searchName'
  
  get 'marriege_items/:id' => 'marriege_items#show'
  get 'marriege_items/:id/edit' => 'marriege_items#edit'

  get 'death_record_items/:id' => 'death_record_items#show'
  get 'death_record_items/:id/edit' => 'death_record_items#edit'

  get 'validators/not_valid_index/:tabla' => 'validators#not_valid_index'
  get 'validators/table_index/:tabla' => 'validators#table_index'
  get 'validators/pending_index/:tabla' => 'validators#pending_index'
  get 'validators/new/:dato' => 'validators#new'

  get 'baptism_items/:id/print' => 'baptism_items#print'
  get 'confirmation_items/:id/print' => 'confirmation_items#print'
  get 'death_record_items/:id/print' => 'death_record_items#print'
  get 'marriege_items/:id/print' => 'marriege_items#print'
  
  resources :validators
  resources :user_managers
  resources :change_logs
  resources :user_logs
  resources :marriege_items
  resources :death_record_items
  resources :marriege_books
  resources :death_record_books
  
  resources :baptism_books do
    resources :baptism_items
  end  
  resources :marriege_books do
    resources :marriege_items
  end  
  resources :confirmation_books do
    resources :confirmation_items
  end
   resources :death_record_books do
    resources :death_record_items
  end

  resources :confirmation_items
  resources :confirmation_books
  resources :baptism_items
  resources :baptism_books
  
  resources :churches
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end 
  
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