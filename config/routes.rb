Rails.application.routes.draw do
  root 'contracts#index'
  resources :contracts, only:[:show, :new, :create, :index] do
    resources :delivery_receipts, only: [:create]
  end

  resources :delivery_receipts, only: [:show]
  resources :equipment, only: [:index, :show, :new, :create, :edit, :update]
  resources :prices, only: [:index, :new, :create, :show, :edit, :update]
  resources :companies, only: [:new, :create, :show, :index]
end
