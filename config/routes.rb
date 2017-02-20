Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :home, only: [:index, :destroy]
  resource :admin, only: :show
end
