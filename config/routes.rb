Rails.application.routes.draw do

  root "artists#index}"

  resources :users do
    post '/password' => "users#update_password"
    resources :favorites
  end

  resources :tracks
  resources :albums
  resources :artists
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
