Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  get 'home/top'
  get 'home/about'
  root to: 'home#top'
  devise_for :users
  resources :books, only: [:new, :show, :index, :create]
  resources :users, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
