Rails.application.routes.draw do
  devise_for :users
  root 'shops#index'
  resources :users, only: [:show]
  resources :shops do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
end
