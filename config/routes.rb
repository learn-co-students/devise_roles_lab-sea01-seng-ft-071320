Rails.application.routes.draw do
  devise_for :users

  root to: 'welcome#home'

  resources :users, only: [ :index, :show, :destroy, :unauthorized ]
  resources :posts, only: [ :update ]
end
