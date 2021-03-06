Rails.application.routes.draw do
  root "home#index"

  namespace :api, defaults: { format: :json } do
    resources :users, only: %i[index show] do
      resources :posts, only: %i[index] do
        resources :comments, only: %i[index create]
      end
    end
  end

  devise_for :users
  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
end


