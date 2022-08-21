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

  get "tasks/new", to:'tasks#new'
  post "tasks/new", to:'tasks#create'
end
