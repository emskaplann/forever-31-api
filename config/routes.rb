Rails.application.routes.draw do
  resources :wish_lists
  resources :carts
  resources :products
  resources :child_categories
  resources :categories
  resources :orders
  resources :users
  # signup & login routes
  post '/login', to: 'login#create', as: 'login'
  post '/signup', to: 'users#create', as: 'signup'
  # watson routes
  get '/create_watson_session', to: 'watson#create_watson_session', as: 'create_watson_session'
  post '/post_input_to_watson', to: 'watson#post_input_to_watson', as: 'post_input_to_watson'
  delete '/delete_watson_session', to: 'watson#delete_watson_session', as: 'delete_watson_session'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
