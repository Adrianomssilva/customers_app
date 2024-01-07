Rails.application.routes.draw do

  root 'home#index'

  resources :customers, only: [:show, :index, :new, :create, :edit, :update]
end
