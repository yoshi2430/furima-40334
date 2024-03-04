Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :purchases, only: [:create, :index, :new] 
  end
  resources :purchase_shipping_addresses, only: [:create]
end
