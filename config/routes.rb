Rails.application.routes.draw do
  devise_for :users
  get 'activities/index'
  root to: "activities#index"
  resources :users, only: [:edit, :update]
end
