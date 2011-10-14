Advicecapital::Application.routes.draw do

  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  resources :sessions
  
  resources :users
  resources :news
  resources :boards
  resources :employees
  resource :contacts, :only => [:show, :new]

  namespace :admin do
    root :to => 'dashboard#index'
    resources :advice_pages
    resources :boxes, :only => [:show, :edit]
  end
  
  root :to => "pages#index"

  match '/receive_news', :to => 'pages#receive_news'
  
  match '/disclaimer', :to => 'pages#disclaimer'
  match '/organisation', :to => 'employees#index'

  mount Resque::Server, :at => "/resque"
    
  AdvicePage.all.each do |r|
    match r.slug, :to => "pages#show"
  end

end
