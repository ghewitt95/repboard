Rails.application.routes.draw do
  get "client_dashboard/index"
  get("/dashboard", { :controller => "dashboard", :action => "index" })
  get("/client-dashboard", { :controller => "client_dashboard", :action => "index" })
  get "home/index"
  root to: "home#index"
  # Routes for the Review resource:

  # CREATE
  post("/reviews", { :controller => "reviews", :action => "create" })

  # DELETE
  delete("/reviews/:id", { :controller => "reviews", :action => "destroy" })

  # PROFILE PAGE
  get("/profile/:slug", { :controller => "profiles", :action => "show" })
  #------------------------------
  get "/settings", to: "settings#edit"
  patch "/settings", to: "settings#update"
    devise_for :users
end
