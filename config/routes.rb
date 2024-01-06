Rails.application.routes.draw do
 
  devise_for :users
  # authenticated :user do
  #   root "admin/categories#index", as: :authenticated_root
  # end
  resources :admin, only: [:index, :create, :update]

  namespace :admin do
    get '/admin', to: redirect('/admin/categories'), as: :admin_root
    resources :posts do
      resources :applicants
    end
    resources :categories
    resources :applicants
  end

  # public spot
  resources :posts, only: [:index, :show] do
    resources :applicants
  end

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
