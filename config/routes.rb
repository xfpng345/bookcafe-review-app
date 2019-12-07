Rails.application.routes.draw do
  root 'shops#index'

  resources :shops
end
