Rails.application.routes.draw do
  resources :places
  resources :users do
    resources :clipboards
  end
  resources :topics do
    resources :quotes
  end
  resources :clipboards
  resources :quotes
  resources :sessions

  root 'topics#index'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#delete'

  get '/quotes/:id/add', to: 'quotes#add', as: 'add_quote'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
