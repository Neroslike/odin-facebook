Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
    resources :comments
  end
  post 'posts/:id/create_commment', to: 'posts#create_comment', as: 'create_comment'
  resources :likes, only: %i[create destroy]

  root "posts#index"
end
