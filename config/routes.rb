Rails.application.routes.draw do
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  resources :users 
  resources :sessions, only: [:new, :create, :destroy] 

  
  root 'users#index'

  
  




end