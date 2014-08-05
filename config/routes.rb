Rails.application.routes.draw do

  root 'users#index'

  get "/auth/:provider/callback" => 'sessions#create'

  get 'signout' => 'sessions#destroy', as: :signout

  resources :users

  resources :sessions

  resources :appointments

  get 'book', to: 'appointments#book'

  get 'dashboard', to: 'users#dashboard'

end
