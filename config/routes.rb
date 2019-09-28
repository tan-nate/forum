Rails.application.routes.draw do
  resources :places
  resources :users
  resources :topics do
    resources :quotes
  end
  resources :quotes
  resources :sessions

  root 'topics#index'
  
  get '/quotes/:id/add', to: 'quotes#add', as: 'add_quote'
  get '/quotes/:id/link', to: 'quotes#link', as: 'link_quote'
  post '/quotes/:id/link', to: 'quotes#post_link', as: 'post_link_quote'
  post '/quotes/:id/link_clipboard', to: 'quotes#post_link_clipboard', as: 'post_link_clipboard'
  post '/quotes/:id/vote', to: 'quotes#vote', as: 'post_vote'

  post '/places/:id/follow', to: 'places#follow', as: 'follow_place'
  post '/places/:id/unfollow', to: 'places#unfollow', as: 'unfollow_place'

  post '/topics/:id/follow', to: 'topics#follow', as: 'follow_topic'
  post '/topics/:id/unfollow', to: 'topics#unfollow', as: 'unfollow_topic'

  get '/users/:id/clipboard', to: 'users#clipboard', as: 'clipboard'
  delete '/users/:id/clipboard', to: 'users#clear_clipboard', as: 'clear_clipboard'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#delete'
  get '/auth/facebook/callback' => 'sessions#create'

  get '/forbidden', to: 'errors#forbidden', as: 'forbidden'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
