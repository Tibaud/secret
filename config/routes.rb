Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'dashboard/show'

  # on met le dashboard en view par défaut
  root 'dashboard#show'

  get 'users/new'
  # on détermine les URL login et logout
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :sessions, only: [:create]
  resources :users, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
