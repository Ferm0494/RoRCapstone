Rails.application.routes.draw do
  resources :user, only: [:new, :show]
  resources :session, only: [:new, :create]
  root "session#new" 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
