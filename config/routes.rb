Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users
  get 'activities/index'
  root to: "activities#index"
  resources :users, only: [:edit, :update]
  resources :activities, only: [:index, :new, :create, :show]
  resources :messages,  only: :index
  resources :rooms, only: [:new, :create]
end
