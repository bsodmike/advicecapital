Advicecapital::Application.routes.draw do

  scope "(:locale)", :locale => /da|en/ do #{I18n.available_locales.join("|")}
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
      resources :investors do
					get 'tax_account', :on => :member
			end
      resources :stocks
      resources :users
      resources :company_stocks, :only => [:new, :create, :edit, :update, :show]
      resources :investor_profiles
    end

    match '/contact' => 'contact#new',    :as => 'contact', :via => :get
    match '/contact' => 'contact#create', :as => 'contact', :via => :post

    match '/:locale' => 'pages#index'  
    root :to => "pages#index"
  
    match '/receive_news', :to => 'recipients#new'
  
    match '/disclaimer',   :to => 'pages#disclaimer'
    match '/privacy',      :to => 'pages#privacy'
    match '/organisation', :to => 'employees#index'

    mount Resque::Server, :at => "/resque"
  
    match '/*slugs', :to => 'pages#show'
    
    # AdvicePage.all.each do |r|
    #   match r.slug, :to => "pages#show"
    # end
  end

end
