Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
    resources :comments
  end
  post 'posts/:id/create_commment', to: 'posts#create_comment', as: 'create_comment'
  post 'posts/:id/share_post', to: 'posts#share_post', as: 'share_post'
  get 'posts/:id/new_shared_post', to: 'posts#new_shared_post', as: 'new_shared_post'
  post 'users/create_friendship', to: 'users#create_friendship', as: 'create_friendship'
  post 'users/create_friend_request', to: 'users#create_friend_request', as: 'create_friend_request'
  post 'users/decline_friend_request', to: 'users#decline_friend_request', as: 'decline_friend_request'
  get 'users/:id/edit_user_profile', to: 'users#edit_user_profile', as: 'edit_user_profile'
  patch 'users/:id/update_user_profile', to: 'users#update_user_profile', as: 'update_user_profile'
  get 'users/:id/friends', to: 'users#friends', as: 'friends'
  get 'users/:id/posts', to: 'users#posts', as: 'user_posts'
  resources :likes, only: %i[create destroy index]
  resources :users
  root "posts#index"
end
