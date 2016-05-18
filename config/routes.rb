Rails.application.routes.draw do
  root 'contracts#index'
  resources :contracts, only:[:show, :new, :create, :index] do
    member do
      post :delivery_receipt, to: 'receipts#create_delivery_receipt'
      get  :delivery_receipt, to: 'receipts#show_delivery_receipt'
      post :return_receipt,   to: 'receipts#create_return_receipt'
      get  :return_receipt,   to: 'receipts#show_return_receipt'
    end
  end

  resources :equipment, only: [:index, :show, :new, :create, :edit, :update]
  resources :prices, only: [:index, :new, :create, :show, :edit, :update]
  resources :companies, only: [:new, :create, :show, :index]
end
