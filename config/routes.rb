Rails.application.routes.draw do
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "application#home"


  resources :applications 
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/auth/facebook/callback', to: 'sessions#create'
  

end
