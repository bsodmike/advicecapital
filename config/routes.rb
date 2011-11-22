Advicecapital::Application.routes.draw do

  match '/contact' => 'contact#new', :as => 'contact', :via => :get
  match '/contact' =>  'contact#create', :as => 'contact', :via => :post

  devise_for :users
  

  resources :news
  resources :boards
  
  #resources :contacts, :only => [:new, :create]
  resources :videos

  namespace :admin do
    root :to => 'dashboard#index'
    resources :advice_pages
    resources :boxes, :only => [:index, :show, :edit, :update]
    resources :investors
    resources :users
    resources :employees
  end
  
  root :to => "pages#index"

  match '/receive_news', :to => 'pages#receive_news'
  
  match '/disclaimer', :to => 'pages#disclaimer'
  match '/organisation', :to => 'employees#index'

  mount Resque::Server, :at => "/resque"
  
  match '/*slugs', :to => 'pages#show'
    
  # AdvicePage.all.each do |r|
  #   match r.slug, :to => "pages#show"
  # end



end
