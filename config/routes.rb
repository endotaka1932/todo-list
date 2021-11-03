Rails.application.routes.draw do

  devise_for :users
  root to: 'boards#index'

  resources :boards do
    resources :tasks do
      resources :comments, only: [:new, :create, :destroy]
    end
  end
end
