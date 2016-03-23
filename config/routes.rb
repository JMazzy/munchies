Rails.application.routes.draw do
  
  root 'searches#index'
  resources :users, only: [:index]
  resources :searches, only: [:index, :new]
  resources :locations, only: [:create]
end
