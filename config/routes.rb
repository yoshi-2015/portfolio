Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    resource :favorites, only: [:index]
  end

  resources :movies, only: [:index, :show]
  resources :movie_comments, only: [:create, :destroy]
end
