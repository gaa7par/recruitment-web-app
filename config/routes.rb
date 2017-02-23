Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :home, only: [:index, :destroy] do
    collection do
      post :import
    end
  end

  namespace :admin do
    resources :users, only: [:index, :new, :edit, :create, :update]
  end
end
