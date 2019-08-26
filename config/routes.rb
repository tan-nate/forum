Rails.application.routes.draw do
  resources :places
  resources :quotes
  resources :users
  resources :topics
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
