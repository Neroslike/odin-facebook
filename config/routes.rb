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
  post 'users/create_friend_request', to: 'users#create_friend_request', as: 'create_friend_request'
  post 'users/decline_friend_request', to: 'users#decline_friend_request', as: 'decline_friend_request'
  get 'users/:id/edit_user_profile', to: 'users#edit_user_profile', as: 'edit_user_profile'
  patch 'users/:id/update_user_profile', to: 'users#update_user_profile', as: 'update_user_profile'
  resources :likes, only: %i[create destroy index]
  resources :users
  root "posts#index"
end
