Rails.application.routes.draw do
  resources :places
  resources :users
  resources :topics do
    resources :quotes
  end
  resources :quotes
  resources :sessions

  root 'topics#index'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
