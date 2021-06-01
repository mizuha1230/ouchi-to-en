Rails.application.routes.draw do
  get 'rooms/index'
  devise_for :users
  root to: "activities#index"
  resources :users, only: [:edit, :update]
  resources :activities, only: [:index, :new, :create, :show]

  resources :rooms, only: [:index, :new, :create] do
    resources :messages, only: [:index, :create]
  end

end
