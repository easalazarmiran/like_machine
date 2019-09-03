# commit

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'links#index'
  resources :links, only: [:new, :create, :destroy]
  resources :likes, only: [:create, :destroy]
end
