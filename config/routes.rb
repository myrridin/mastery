Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :scheduled_courses
  resources :courses
  root to: "courses#index"
end
