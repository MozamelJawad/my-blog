Rails.application.routes.draw do
  devise_for :users
   # Defines the root path route ("/")
  # root "posts#index"
  # get "users/:user_id/posts", to: "posts#index", as: "user_posts"
  # get "users/:user_id/posts/:id", to: "posts#show", as: "user_post"
  # get "users", to: "users#index", as: "users"
  # get "users/:id", to: "users#show", as: "user"

  root "users#index"

  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
end
