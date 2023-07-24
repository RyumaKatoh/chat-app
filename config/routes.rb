Rails.application.routes.draw do
  root to: "messages#index"
  resources :users, only: [:edit, :update]
  devise_for :users
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
end
