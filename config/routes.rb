Rails.application.routes.draw do
  root 'shops#index'

  get 'shops/index'

  get 'shops/show'

  get 'shops/search'

  get 'shops/edit'

  get 'shops/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
