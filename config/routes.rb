Rails.application.routes.draw do

  get 'languages/:id/frameworks' => 'frameworks#index', as: 'index_frameworks'
  get 'languages/:id/frameworks/top' => 'frameworks#top', as: 'top_frameworks'
  get 'languages/:id/frameworks/new' => 'frameworks#new', as: 'framework_new'
  post 'languages/:id/frameworks/new' => 'frameworks#create', as:'frameworks'
  get 'languages/:id/frameworks/:id2/edit'=> 'frameworks#edit', as: 'edit_framework'
  get 'frameworks' => 'frameworks#index2', as:'all_frameworks'
  get 'frameworks/top' => 'frameworks#top2', as: "top_overall"
  # get 'frameworks/other/new', => 'frameworks#others'as: "other_new_framework"
  patch 'languages/:id/frameworks/:id2' => 'frameworks#update', as: 'update_framework'
  
  get 'languages/index' => 'languages#index'
  get 'languages/index/top' => 'languages#top'
  get 'languages/index/poblated' => 'languages#poblated'
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
