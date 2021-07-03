Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'pages#index'
  get 'pages/show'
  get 'pages/index'
  get 'test/starter'
  get "login", to: "login#index"
end
