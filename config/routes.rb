Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :spaceships, only: [:index, :show, :new, :create, :edit, :update] do
    resources :reservations, only: [ :create, :new ]
  end
  resources :reservations, only: [:destroy]

  resources :users, only: [:show] do
    member do
      get 'resas', to: 'users#resas'
    end
  end

  post 'status', to: 'users#change_status'
end
