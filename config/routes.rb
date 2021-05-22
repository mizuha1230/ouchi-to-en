Rails.application.routes.draw do
  devise_for :users
  get 'activities/index'
  root to: "activities#index"
  resources :users, only: [:edit, :update]
  resources :activities, only: [:index, :new]
end
