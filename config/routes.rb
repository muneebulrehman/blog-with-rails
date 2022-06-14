Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
end


