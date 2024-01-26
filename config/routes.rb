Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :homes, only: [:index, :show]
end
