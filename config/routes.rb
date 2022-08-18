Rails.application.routes.draw do
  get 'tasks/new'
  devise_for :users
  get 'home/index'
  root 'static_pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
