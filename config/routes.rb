Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'
  root 'static_pages#home'
  get  'static_pages/help'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :users
  resources :entries, only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end