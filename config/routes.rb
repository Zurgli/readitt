Rails.application.routes.draw do
  # Routes for the C_vote resource:
  # CREATE
  get "/c_votes/new", :controller => "c_votes", :action => "new"
  post "/create_c_vote", :controller => "c_votes", :action => "create"

  # READ
  get "/c_votes", :controller => "c_votes", :action => "index"
  get "/c_votes/:id", :controller => "c_votes", :action => "show"

  # UPDATE
  get "/c_votes/:id/edit", :controller => "c_votes", :action => "edit"
  post "/update_c_vote/:id", :controller => "c_votes", :action => "update"

  # DELETE
  get "/delete_c_vote/:id", :controller => "c_votes", :action => "destroy"
  #------------------------------

  # Routes for the P_vote resource:
  # CREATE
  get "/p_votes/new", :controller => "p_votes", :action => "new"
  post "/create_p_vote", :controller => "p_votes", :action => "create"

  # READ
  get "/p_votes", :controller => "p_votes", :action => "index"
  get "/p_votes/:id", :controller => "p_votes", :action => "show"

  # UPDATE
  get "/p_votes/:id/edit", :controller => "p_votes", :action => "edit"
  post "/update_p_vote/:id", :controller => "p_votes", :action => "update"

  # DELETE
  get "/delete_p_vote/:id", :controller => "p_votes", :action => "destroy"
  #------------------------------

  # Routes for the Comment resource:
  # CREATE
  get "/comments/new", :controller => "comments", :action => "new"
  post "/create_comment", :controller => "comments", :action => "create"

  # READ
  get "/comments", :controller => "comments", :action => "index"
  get "/comments/:id", :controller => "comments", :action => "show"

  # UPDATE
  get "/comments/:id/edit", :controller => "comments", :action => "edit"
  post "/update_comment/:id", :controller => "comments", :action => "update"

  # DELETE
  get "/delete_comment/:id", :controller => "comments", :action => "destroy"
  #------------------------------

  # Routes for the Post resource:
  # CREATE
  get "/posts/new", :controller => "posts", :action => "new"
  post "/create_post", :controller => "posts", :action => "create"

  # READ
  get "/posts", :controller => "posts", :action => "index"
  get "/posts/:id", :controller => "posts", :action => "show"

  # UPDATE
  get "/posts/:id/edit", :controller => "posts", :action => "edit"
  post "/update_post/:id", :controller => "posts", :action => "update"

  # DELETE
  get "/delete_post/:id", :controller => "posts", :action => "destroy"
  #------------------------------

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
