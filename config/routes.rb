Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
    resources :comments
  end
  post 'posts/:id/create_commment', to: 'posts#create_comment', as: 'create_comment'
  post 'users/create_friendship', to: 'users#create_friendship', as: 'create_friendship'
  resources :likes, only: %i[create destroy]
  resources :users
  root "posts#index"
end
