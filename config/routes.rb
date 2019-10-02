Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

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
