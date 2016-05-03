Rails.application.routes.draw do
  resources :contracts, only: [:index]
end
