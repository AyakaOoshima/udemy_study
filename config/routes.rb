Rails.application.routes.draw do
  get 'boards', to: 'boards#index'
  get 'boards/new', to: 'boards#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end