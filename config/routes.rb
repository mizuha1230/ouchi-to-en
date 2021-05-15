Rails.application.routes.draw do
  get 'activities/index'
  root to: "activities#index"
end
