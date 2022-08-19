Rails.application.routes.draw do
  root 'static_pages#home'
  get 'home/index'

  devise_for :users
  resources :users
  resources :tasks

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
