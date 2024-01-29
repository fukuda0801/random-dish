Rails.application.routes.draw do
  root to: 'homes#index'
  get 'users/show'
  devise_for :users
  resources :homes, only: [:index, :show]
  resources :users, only: [:index, :show, :destroy]
end
