Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  get 'home/index'

  resources :tasks
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
