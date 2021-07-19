Rails.application.routes.draw do
  root 'dashboard#index'
  get 'top', to:'top#index'
  get 'auth/:provider/callback', to: 'sessions#create_google_user'
  get 'auth/failure', to: redirect('/login')
  get 'log_out', to: 'sessions#destroy', as: 'log_out'
  post 'login', to:'login#index'
  get 'login', to:'login#index'
  get 'dashboard', to:'dashboard#index', as: 'dashboard'
  get 'floorMaster', to:'floor_master#index', as: 'floorMaster'
  resources :sessions, only: %i[create destroy]
end
