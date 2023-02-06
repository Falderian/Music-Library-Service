Rails.application.routes.draw do

  root "artists#index"

  resources :users do
    post '/password' => "users#update_password"
  end

  resources :artists
  resources :albums
  resources :tracks
  
  get '/favs/:user_id' => 'favorites#index'

  post '/favs/:user_id' => 'favorites#update'
  delete '/favs/:user_id' => 'favorites#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
