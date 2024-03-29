Rails.application.routes.draw do

  root 'home#index'

  resources :customers, only: [:show, :index, :new, :create, :edit, :update] do
    patch 'delete', on: :member
    get 'search', on: :collection
  end
end
