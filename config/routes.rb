Rails.application.routes.draw do
  resources :places
  resources :users
  resources :topics do
    resources :quotes
  end
  resources :quotes
  resources :sessions

  get '/quotes/:id/add', to: 'quotes#add', as: 'add_quote'
  get '/users/:id/clipboard', to: 'users#clipboard', as: 'clipboard'

  root 'topics#index'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
