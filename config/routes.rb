Rails.application.routes.draw do
  root "home#index"

  get "/dashboard" => "dashboard#index"
  get "/client-dashboard" => "client_dashboard#index"

  # Routes for the Review resource:
  post "/reviews" => "reviews#create"
  delete "/reviews/:id" => "reviews#destroy"

  # Profile page
  get "/profile/:slug" => "profile#show"

  # Settings
  get "/settings" => "settings#edit"
  patch "/settings" => "settings#update"

  devise_for :users
end
