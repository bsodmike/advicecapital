Advicecapital::Application.routes.draw do

  resources :users
  resources :news
  resources :boards
  resources :employees
  resources :sessions
  resources :contacts

  match 'disclaimer', :to => 'pages#disclaimer'
  match 'news', :to => 'news#index'
  match 'signin', :to => 'sessions#new'
  match 'signout', :to => 'sessions#destroy'
  
  match 'organisation', :to => 'employees#index'

  #match '/employees', :redirect => ('/organisation')

  #match '/organisation/employees', :to => 'employees#index'
  #match '/organisation/board', :to => 'boards#index'

  match 'contact', :to => 'contacts#new'
  match 'admin', :to => 'admin#index'


  root :to => "pages#index"
  
  AdvicePages.get_pages.each do |key, value|
    match key, :to => "pages#show"
  end


end
