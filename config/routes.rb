Advicecapital::Application.routes.draw do

  resources :investor_profiles

  get "investor_profiles/index"

  get "investor_profiles/new"

  get "investor_profiles/create"

  get "investor_profiles/edit"

  get "investor_profiles/update"

  get "investor_profiles/show"

  get "investor_profiles/destroy"

  devise_for :users
  
  resources :news
  resources :boards
  resources :videos
  resources :employees
  resources :recipients

  namespace :admin do
    root :to => 'dashboard#index'
    resources :advice_pages    
    resources :boxes, :only => [:index, :show, :edit, :update]
    resources :investors
    resources :stocks
    resources :users
    resources :company_stocks, :only => [:edit, :update, :show]
    #resources :recipients
  end

  match '/contact' => 'contact#new', :as => 'contact', :via => :get
  match '/contact' =>  'contact#create', :as => 'contact', :via => :post
  
  root :to => "pages#index"
  
  match '/receive_news', :to => 'recipients#new'
  #match '/receive_news', :to => 'admin/recipients#new'
  
  match '/disclaimer', :to => 'pages#disclaimer'
  match '/privacy', :to => 'pages#privacy'
  match '/organisation', :to => 'employees#index'

  mount Resque::Server, :at => "/resque"
  
  match '/*slugs', :to => 'pages#show'
    
  # AdvicePage.all.each do |r|
  #   match r.slug, :to => "pages#show"
  # end

end
