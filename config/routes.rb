Rails.application.routes.draw do
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "application#home"
  resources :users, only: [:show]
  resources :questions
  resources :applications 
 
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/auth/facebook/callback', to: 'sessions#create'
    

end
