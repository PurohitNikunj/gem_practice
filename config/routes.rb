Rails.application.routes.draw do
  resources :books
  ActiveAdmin.routes(self)

  resources :users, only: [:new,:create]
  get '/login', to: "sessions#login", as: "login"
  post '/login', to: "sessions#post_login"
  delete '/logout', to: "sessions#log_out", as: "logout"
  root "books#index"
end
