Rails.application.routes.draw do
  root 'dashboard#index'
  get 'top', to:'top#index'
  get 'auth/:provider/callback', to: 'sessions#create_google_user'
  get 'auth/failure', to: redirect('/login')
  get 'log_out', to: 'sessions#destroy', as: 'log_out'
  post 'login', to:'login#index'
  get 'login', to:'login#index'
  get 'dashboard', to:'dashboard#index', as: 'dashboard'
  get 'permissionSettings', to:'permission_settings#index', as: 'permissionSettings'
  get 'bugMaster', to:'bug_master#index', as: 'bugMaster'
  get 'floorMaster', to:'floor_master#index', as: 'floorMaster'
  get 'signMaster', to:'sign_master#index', as: 'signMaster'
  get 'appMaster', to:'app_master#index', as: 'appMaster'
  get 'textExtraction', to:'text_extraction#index', as: 'textExtraction'
  get 'kintoneConnect', to:'kintone_connect#index', as: 'kintoneConnect'
  get 'calendarTools', to:'calendar_tools#index', as: 'calendarTools'
  resources :sessions, only: %i[create destroy]
end
