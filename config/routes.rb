Rails.application.routes.draw do
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "application#home"
  resources :users do
       resources :job_titles
  end 

  resources :applications do 
    resources :comments
  end

  get "about" => "application#about", as: :about

  #get "applications/:id/next", to: "applications#next"
 
 
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create'
    

end
