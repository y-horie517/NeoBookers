Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  get 'home/top'
  get 'home/about'
  root to: 'home#top'
  devise_for :users
  get "users/:id" => "users#show", as: :mypage

  resources :books, only: [:new, :show, :index, :create]
  resources :users, only: [:show, :index, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
