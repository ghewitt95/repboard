Rails.application.routes.draw do
  root "home#index"

  get "/dashboard" => "dashboard#index", as: :dashboard
  get "/client-dashboard" => "client_dashboard#index", as: :client_dashboard

  # Routes for the Review resource:
  post "/reviews" => "reviews#create", as: :reviews
  delete "/reviews/:id" => "reviews#destroy", as: :review

  # Profile page
  get "/profile/:slug" => "profiles#show", as: :profile

  # Settings
  get "/settings" => "settings#edit", as: :settings
  patch "/settings" => "settings#update"

  devise_for :users
end
