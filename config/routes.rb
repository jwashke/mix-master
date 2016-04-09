Rails.application.routes.draw do
  root to: 'artists#index'

  resources :artists do
    resources :songs, only: [:new, :create, :index]
  end
  resources :songs, only: [:show, :edit, :update, :index, :destroy]
end
