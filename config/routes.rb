Rails.application.routes.draw do
  get 'reviews/new'
  post 'reviews/create'
  get 'bookings', to: 'bookings#index'
  get 'bookings/:id', to: 'bookings#show', as: 'booking'
  get 'cars/:id/bookings/new', to: 'bookings#new', as: 'new_booking'
  post 'cars/:id/bookings', to: 'bookings#create'
  get 'bookings/:id/edit', to: 'bookings#edit', as: 'edit_booking'
  patch 'bookings/:id', to: 'bookings#update'
  delete 'bookings/:id', to: 'bookings#destroy'
  # get 'cars/index'
  # get 'cars/show'
  # get 'cars/new'
  # get 'cars/create'
  # get 'cars/edit'
  # get 'cars/update'

  root to: "pages#home"

  resources :cars
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
