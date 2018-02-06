Rails.application.routes.draw do
  root 'dashboard#show'
  get 'users/new'
  # on détermine les URL login et logout
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :sessions, only: [:create]
  resources :users, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
