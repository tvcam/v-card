Rails.application.routes.draw do
  get 'users/show'
  get 'home/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root 'home#index'

  resources :users, only: [:show]
end
