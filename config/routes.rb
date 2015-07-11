Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  root to: "offerings#dashboard"

  resources :courses

  # Offerings
  get "/classes/", to: "offerings#index", as: "offerings"
  get "/classes/new", to: "offerings#new", as: "new_offering"
  get "/classes/dashboard", to: "offerings#dashboard", as: "user_dashboard"
  get "/classes/:id", to: "offerings#show", as: "offering"
  get "/classes/:id/sign_up", to: "offerings#sign_up", as: "sign_up_for_offering"
  get "/casses/:id/drop", to: "offerings#drop", as: "drop_offering"
  post "/classes/", to: "offerings#create"
  delete "/classes/:id", to: "offerings#destroy"
end
