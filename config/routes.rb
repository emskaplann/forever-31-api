Rails.application.routes.draw do
  resources :carts
  resources :products
  resources :child_categories
  resources :categories
  resources :orders
  resources :users

  post '/login', to: 'login#create', as: 'login'
  post '/signup', to: 'users#create', as: 'signup'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
