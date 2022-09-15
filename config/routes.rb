Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  # get 'boards', to: 'boards#index'
  # get 'boards/new', to: 'boards#new'
  # post 'boards', to: 'boards#create'
  # get 'boards/:id', to: 'boards#show'

  # リソースベースに書き換え
  resources :boards

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  # 
  resources :comments, only: %i[create destroy]
end