Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
    collection do
      get 'search'
    end
  end
  resources :relationships, only: [:create, :destroy]
  get 'home/index'

  resources :tasks, only: [:new, :create]
  get 'countdown', to:'tasks#countdown'
end
