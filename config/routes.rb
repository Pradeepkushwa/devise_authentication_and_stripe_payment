Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :posts
  get "user/create"
  get "pages/index"
      
  # resources :sessions, only: [:new, :create]
  root to: 'posts#index'


   # post "/sessions", to: "payments#create"
   post "/sessions/checkout", to: "sessions#checkout"
   # get "/sessions/retrive_checkout", to: "sessions#retrive_checkout"

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
end
