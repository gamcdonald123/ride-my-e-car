Rails.application.routes.draw do
  devise_for :users
  get 'reviews/new'
  post 'reviews/create'
  # get 'cars/index'
  # get 'cars/show'
  # get 'cars/new'
  # get 'cars/create'
  # get 'cars/edit'
  # get 'cars/update'


  root to: "pages#home"

  resources :cars do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:create]
  end

  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
