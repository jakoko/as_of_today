Rails.application.routes.draw do
  
  # Using Page Controller to view
  root 'pages#home', as: :home

  # Logging in and out a user
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # User-related routes
  get 'users' => 'users#index', as: :users
  get 'user/new' => 'users#new', as: :new_user
  get 'user/account' => 'users#user_account'
  get 'user/:user_id' => 'users#show', as: :user
  post 'users' => 'users#create'
  get "user/:user_id/edit" => "users#edit", as: :edit_user
  patch "user/:user_id" => "users#update"
  delete 'user/:user_id' => 'users#destroy'

  # Portfolio-related routes
  get 'portfolios' => 'portfolios#index', as: :portfolios
  get 'user/:user_id/portfolios' => 'portfolios#show_user_portfolios', as: :user_portfolios
  get 'user/:user_id/portfolio/new' => 'portfolios#new', as: :new_portfolio
  post 'portfolios' => 'portfolios#create'
  get 'user/:user_id/portfolio/:id' => 'portfolios#show', as: :portfolio
  get 'user/:user_id/portfolio/:id/edit' => 'portfolios#edit', as: :edit_portfolio
  patch 'portfolios' => 'portfolios#update'
  delete 'user/:user_id/portfolio/:id' => 'portfolios#destroy'

  # Photo related routes
  get 'photo/:photo_id' => 'photos#show', as: :photo

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
