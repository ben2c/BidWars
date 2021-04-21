Rails.application.routes.draw do

  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout
  delete '/logout' => 'sessions#destroy'

  resources :categories
  resources :bids
  
  resources :users do 
    resources :items, only: [:new, :create, :index]
  end 

  resources :items do 
    resources :bids
  end
  #root 'sessions#omniauth'

  #get '/auth/google_oath2/callback', to: 'sessions#omniauth'
  #get '/auth/:provider/callback', to: 'sessions#omniauth' #dynamic for whatever provider sign in


end
