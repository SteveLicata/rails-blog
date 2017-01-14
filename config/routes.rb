Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #USERS
  get     "/users"             =>  "users#index", as: "users"
  # sign up:
  get     "/signup"            =>  "users#new", as: "new_user"
  post    "/users"             =>  "users#create"
  # show, edit, update, destroy:
  get     "/users/:id"         =>  "users#show", as: "user"
  get     "/users/:id/edit"    =>  "users#edit", as: "edit_user"
  put     "/users/:id"         =>  "users#update"
  patch   "/users/:id"         =>  "users#update"
  delete  "/users/:id"         =>  "users#destroy"
  # login
  get     "/login"             =>  "users#login_form"
  post    "/login"             =>  "users#create_login"
  # logout
  get     "/logout"            =>  "users#logout"


  #POSTS
  get     "/posts"             =>  "posts#index", as: "posts"
  # new post:
  get     "/newpost"           =>  "posts#new", as: "new_post"
  post    "/posts"             =>  "posts#create"
  # show, edit, update, destroy:
  get     "/posts/:id"         =>  "posts#show", as: "post"
  get     "/posts/:id/edit"    =>  "posts#edit", as: "edit_post"
  put     "/posts/:id"         =>  "posts#update"
  patch   "/posts/:id"         =>  "posts#update"
  delete  "/posts/:id"         =>  "posts#destroy"


  # COMMENTS:
  get     "/comments"          =>  "comments#index", as: "comments"
  # new comment:
  get     "/newcomment"        =>  "comments#new", as: "new_comment"
  post    "/comments"          =>  "comments#create"
  # show, edit, update, destroy:
  get     "/comments/:id"      =>  "comments#show", as: "comment"
  get     "/comments/:id/edit" =>  "comments#edit", as: "edit_comment"
  put     "/comments/:id"      =>  "comments#update"
  patch   "/comments/:id"      =>  "comments#update"
  delete  "/comments/:id"      =>  "comments#destroy"


  resources :posts


end
