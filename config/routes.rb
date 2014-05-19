Rails.application.routes.draw do

  root 'users#index'

  get '/register', to: 'users#new', as: :register

  post '/users', to: 'users#create', as: :users
end
