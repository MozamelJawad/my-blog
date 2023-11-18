Rails.application.routes.draw do

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  devise_for :users

  root "users#index"

  namespace :api do
    resources :posts do
      resources :comments
    end
  end

  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
end
