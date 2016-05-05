Rails.application.routes.draw do
  root 'home#index'
  resources :contracts, only:[:show, :new, :create, :index]
  resources :equipment, only: [:index, :show]
  resources :prices, only: [:index]
end
