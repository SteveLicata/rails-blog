class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @message = "Sign up for World Travel Blog !"
  end

  def create
    @new_user = User.create(
      fname: params[:user][:fname],
      lname: params[:user][:lname],
      password: params[:user][:password],
      username: params[:user][:username],
      email: params[:user][:email]
      )

    if @new_user
      session[:user_id] = @new_user.id
      redirect_to url_for(:controller => :users, :action => :index)
        else
      redirect_to url_for(:controller => :users, :action => :new)
    end
   end

   def show
     @user = User.find(params[:id])

     @user_posts = @user.posts

     if session[:user_id] # if logged in
       @message = "You're now logged in! This is your profile page."
     else
       @message = "You're not logged in yet."
     end
   end

   def edit
     @user = User.find(params[:id])
   end

   def update
     @user = User.find(params[:id])
     @user.update({
       fname: params[:user][:fname],
       lname: params[:user][:lname],
       password: params[:user][:password],
       username: params[:user][:username],
       email: params[:user][:email]
       })

    if (@user)
      redirect_to url_for(:controller => :users, :action => :index)
    else
      redirect_to url_for(:controller => :users, :action => :edit)
    end
  end

  def destroy
    User.delete(params[:id])
    session.destroy
    redirect_to url_for(:controller => :users, :action => :index)
  end

  def login_form
    if session[:user_id] # if logged in
      @message = "You're already logged in!"
    else
      @message = "You're not logged in yet. Login below!"
    end
  end

  def create_login
    @user = User.where(username: params[:username], password: params[:password]).first

    if @user
      session[:user_id] = @user.id
      # redirect_to url_for(:controller => :users, :action => :index)
      redirect_to user_path(session[:user_id])
    else
      redirect_to url_for(:controller => :users, :action => :login)
    end
  end

  def logout
    session.destroy
    redirect_to url_for(:controller => :users, :action => :index)
  end

end
