Rails.application.routes.draw do
  get 'books/welcome'

  root to: 'books#index'
  devise_for :users
  resources :users
  resources :books
end
