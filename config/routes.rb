Advicecapital::Application.routes.draw do

  resources :users
  resources :news
  resources :boards
  resources :employees
  resources :sessions, :only => [:new, :create, :destroy]

#  match '/organisation', :to => 'pages#organisation'
  match 'investor_login', :to => 'pages#investor_login'
  match 'invest_universe', :to => 'pages#invest_universe'
  match 'become_customer', :to => 'pages#become_customer'
  match 'disclaimer', :to => 'pages#disclaimer'
  match 'news', :to => 'news#index'
  match 'signin', :to => 'sessions#new'
  match 'signout', :to => 'sessions#destroy'
  
  match 'organisation', :to => 'employees#index'

  #match '/employees', :redirect => ('/organisation')

  #match '/organisation/employees', :to => 'employees#index'
  #match '/organisation/board', :to => 'boards#index'

  match '/contact', :to => 'pages#contact'


  root :to => "pages#index"



  #match '*path' => 'page#show'
  
  AdvicePages.get_pages.each do |key, value|
    match key, :to => "pages#show"
  end
end
