Rails.application.routes.draw do
  root to: "messages#index"
  resources :messages
  devise_for :users
end
