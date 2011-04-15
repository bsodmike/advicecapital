Advicecapital::Application.routes.draw do

  resources :employees

  # Main Menu
  match '/about_ac', :to => 'pages#about_ac'
  match '/about_ai', :to => 'pages#about_ai'
  match '/organisation', :to => 'pages#organisation'
  match '/investor_login', :to => 'pages#investor_login'
  match '/invest_universe', :to => 'pages#invest_universe'
  match '/become_customer', :to => 'pages#become_customer'
  match '/disclaimer', :to => 'pages#disclaimer'
  match '/news', :to => 'pages#news'

  match '/organisation/employees', :to => 'employees#index'

  match '/', :to => 'pages#index'
  match '/contact', :to => 'pages#contact'
  
  resources :employees

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
  # root :to => "welcome#index"

  root :to => "pages#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'

  #match '*path' => 'page#show'
end
