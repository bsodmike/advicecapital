Advicecapital::Application.routes.draw do

  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  resources :sessions
  
  resources :users
  resources :news
  resources :boards
  resources :employees
  resource :contacts, :only => [:show, :new, :create]

  namespace :admin do
    root :to => 'dashboard#index'
    resources :advice_pages
  end
  
  root :to => "pages#index"  
  
  match '/disclaimer', :to => 'pages#disclaimer'
  match '/organisation', :to => 'employees#index'
    
  AdvicePage.all.each do |r|
    match r.slug, :to => "pages#show"
  end

end
