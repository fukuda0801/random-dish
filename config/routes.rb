Rails.application.routes.draw do
  root to: 'homes#index'
  get 'users/show'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :homes, only: [:index, :show]
  resources :users, except: [:new, :create]
end
