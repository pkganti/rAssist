Rails.application.routes.draw do

  root :to => 'pages#home'
  get '/about' => 'pages#about'
  get '/search' => 'users#search', as: 'search'

  get '/users/edit' => 'users#edit'
  resources :users, :except => [:edit]

  get '/search' => 'locations#search'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy'
end
