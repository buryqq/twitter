Rails.application.routes.draw do
  resources :users
resources :tweets
  root 'tweets#index'
get '/bootstrap', to: 'tweets#bootstrap'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
