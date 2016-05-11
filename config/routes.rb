Rails.application.routes.draw do
  root 'contracts#index'
  resources :contracts, only:[:show, :new, :create, :index]
  resources :equipment, only: [:index, :show]
  resources :prices, only: [:index, :new, :create, :show]
end
