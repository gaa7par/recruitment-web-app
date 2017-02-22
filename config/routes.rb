Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :home, only: [:index, :destroy]

  namespace :admin do
    resources :users, only: [:index, :new, :edit, :create, :update]
  end
end
