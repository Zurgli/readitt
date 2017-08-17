Rails.application.routes.draw do
  # Routes for the Subscription resource:
  # CREATE
  get "/subscriptions/new", :controller => "subscriptions", :action => "new"
  post "/create_subscription", :controller => "subscriptions", :action => "create"

  # READ
  get "/subscriptions", :controller => "subscriptions", :action => "index"
  get "/subscriptions/:id", :controller => "subscriptions", :action => "show"

  # UPDATE
  get "/subscriptions/:id/edit", :controller => "subscriptions", :action => "edit"
  post "/update_subscription/:id", :controller => "subscriptions", :action => "update"

  # DELETE
  get "/delete_subscription/:id", :controller => "subscriptions", :action => "destroy"
  #------------------------------

  # Routes for the Topic resource:
  # CREATE
  get "/topics/new", :controller => "topics", :action => "new"
  post "/create_topic", :controller => "topics", :action => "create"

  # READ
  get "/topics", :controller => "topics", :action => "index"
  get "/topics/:id", :controller => "topics", :action => "show"

  # UPDATE
  get "/topics/:id/edit", :controller => "topics", :action => "edit"
  post "/update_topic/:id", :controller => "topics", :action => "update"

  # DELETE
  get "/delete_topic/:id", :controller => "topics", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
