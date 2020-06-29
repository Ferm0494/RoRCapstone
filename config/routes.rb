Rails.application.routes.draw do

  get 'languages/index' => 'languages#index'
  get 'languages/index/top' => 'languages#top'
  get 'languages/index/poblated' => 'languages#poblated'
  get 'language/:id' => 'languages#show', as: "show_specific_lang"
  get 'languages/new' => 'languages#new'
  post 'languages/new' => 'languages#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  patch '/' => 'users#update', as: "update_user"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy',as: "logout"


  root "users#show" 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
