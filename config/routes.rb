Rails.application.routes.draw do
  resources :categories
  resources :comments
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :users
root 'sessions#omniauth'

#get '/auth/google_oath2/callback', to: 'sessions#omniauth'
get '/auth/:provider/callback', to: 'sessions#omniauth' #dynamic for whatever provider sign in


end
