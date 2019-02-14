Rails.application.routes.draw do
  get 'meishis/index'
  get 'meishis/show'
  get 'meishis/new'
  get 'meishis/edit'
  root to: 'meishis#index'
  resources :meishis
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
