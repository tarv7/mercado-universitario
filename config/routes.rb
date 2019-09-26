Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
  get 'restricted_area', to: 'restricted_area#change'

  resources :categories, only: %i[index] do
    resources :products, only: %i[index show]
  end

  resources :order_products
  resources :products
  resources :sellers do
    resources :products, only: %i[index show]
  end

  resources :orders
  resources :reviews
  resources :categories
end
