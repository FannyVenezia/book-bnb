Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/new'
  get 'reviews/destroy'
  devise_for :users
  root to: 'pages#home'

  resources :books do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy, :edit, :update, :index, :show]
end
