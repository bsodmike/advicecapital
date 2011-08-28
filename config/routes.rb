Advicecapital::Application.routes.draw do

  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  resources :sessions
  
  resources :users
  resources :news
  resources :boards
  resources :employees
  resource :contacts, :only => [:show, :new, :create]

  match '/admin', :to => 'admin#index' 
  
  root :to => "pages#index"  
  
  match '/disclaimer', :to => 'pages#disclaimer'
  match '/organisation', :to => 'employees#index'
  
  AdvicePages.get_pages.each do |key, value|
    match key, :to => "pages#show"
  end

end
