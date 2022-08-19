Rails.application.routes.draw do
  get 'users/index'
  get 'tasks/new'
  devise_for :users
  get 'home/index'
  root 'static_pages#home'
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
