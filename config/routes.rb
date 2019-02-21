Rails.application.routes.draw do
  
  devise_for :users
  get 'home/index'
  get 'meishis/:id/:url' => 'meishis#show'

  get 'meishis/index'
  get 'meishis/show'
  get 'meishis/new'
  get 'meishis/edit'
  post 'meishis/:id/:url/#edit' => 'meishis#edit'
  post 'meishis/:id/:url' => 'meishis#show'

  root to: 'home#index'
  resources :meishis
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
