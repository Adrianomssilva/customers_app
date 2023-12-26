Rails.application.routes.draw do

  root 'home#index'

  resources :customers, only: [:show, :index]
end
