Rails.application.routes.draw do
  root 'top#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/login')
  get 'log_out', to: 'sessions#destroy', as: 'log_out'
  post 'login', to:'login#index'
  get 'login', to:'login#index'
  resources :sessions, only: %i[create destroy]
end
