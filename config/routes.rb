Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :spaceships, only: [:index, :show, :new, :create] do
    resources :reservations, only: [ :create, :new ]
  end
  resources :reservations, only: [:destroy]
end
