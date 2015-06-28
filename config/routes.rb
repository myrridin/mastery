Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  root to: "courses#index"

  resources :courses

  # Offerings
  get "/offerings/", to: "offerings#index", as: "offerings"
  get "/offerings/:id", to: "offerings#show", as: "offering"
  get "/offerings/new", to: "offerings#new", as: "new_offering"
  get "/offerings/:id/sign_up", to: "offerings#sign_up", as: "sign_up_for_offering"
  post "/offerings/:id", to: "offerings#create"
end
