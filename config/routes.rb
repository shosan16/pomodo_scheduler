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

  resources :relationships, only: %i[create destroy]

  resources :tasks, only: %i[new create]
  get 'countdown', to: 'tasks#countdown'
end
