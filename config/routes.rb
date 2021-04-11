Rails.application.routes.draw do

  root to: 'items#index'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  resources :categories
  resources :comments
  resources :items
  resources :users
  #root 'sessions#omniauth'

  #get '/auth/google_oath2/callback', to: 'sessions#omniauth'
  #get '/auth/:provider/callback', to: 'sessions#omniauth' #dynamic for whatever provider sign in


end
