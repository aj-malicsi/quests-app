Rails.application.routes.draw do
  resources :categories
  # get '/categories', to "categories#index", as: 'categories'
end
