Rails.application.routes.draw do
  get 'comments/create'

  devise_for :users
  root 'shops#index'

  resources :shops

  resources :users, only: [:show]
end
