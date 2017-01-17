class PostsController < ApplicationController

  def index
    #instance variable holds all posts
      @posts = Post.all
  end

  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def create
    @new_post = Post.create(
      title: params[:post][:title],
      content: params[:post][:content],
      user_id: params[:post][:user_id]
    )
    #creates new comment by parameters

    #if new post, redirect
    if @new_post
      redirect_to url_for(:controller => :posts, :action => :index)
    else
      redirect_to url_for(:controller => :posts, :action => :new)
    end
   end

  def show
    @post = Post.find(params[:id])
    #finds post by id paramter
    @post_user = @post.user.fname
    #displays first name of user that made post
    @comments = @post.comments
    #displays posts comments

    # If theres a session, redirect
    if session[:post_id] # if logged in
      @message = "You're logged in! This is your profile page."
    else
      @message = "You're not logged in yet"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update({
      title: params[:post][:title],
      content: params[:post][:content],
      user_id: params[:post][:user_id]
    })
    #update by parameters

    #if there's a post, redirect
    if (@post)
      redirect_to url_for(:controller => :posts, :action => :index)
    else
      redirect_to url_for(:controller => :posts, :action => :edit)
    end
  end

  def destroy
    Post.delete(params[:id])
    redirect_to url_for(:controller => :posts, :action => :index)
    #method destroys a post
  end

end
