BikeRides::Application.routes.draw do
  resources :users do
    member do
      get "photo"
    end
  end
  resources :rides
  resource :sessions


  root to: 'static_pages#home'
end
