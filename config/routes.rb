Rails.application.routes.draw do
  root 'home#index'
  resources :contracts, only:[:show, :new, :create]
  resources :contracts, only: [:index]
  resources :prices, only: [:index]
end
