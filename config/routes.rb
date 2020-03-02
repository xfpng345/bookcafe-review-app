# frozen_string_literal: true

Rails.application.routes.draw do
  root 'top#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users, only: [:show]
  resources :shops do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
  end
  
end
