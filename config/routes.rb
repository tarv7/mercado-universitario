Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :users, only: %i[index show]

  get 'restricted_area', to: 'restricted_area#change'
  get '/change_locale', to: 'application#change_locale'

  resources :categories, only: %i[index] do
    resources :products, only: %i[index show]
  end

  resources :order_products
  resources :products
  resources :sellers do
    resources :products, only: %i[index show]
    resources :reviews, only: %i[new create edit update destroy]
  end

  resources :orders
  resources :reviews, only: %i[index show]
  resources :categories
end
