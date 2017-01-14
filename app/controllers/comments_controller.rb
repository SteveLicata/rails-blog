class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
  end

  def create
    @new_comment = Comment.create(
      title: params[:post][:title],
      content: params[:post][:content],
      user_id: params[:post][:user_id],
      post_id: params[:post][:post_id]
    )

    if @new_comment
      redirect_to url_for(:controller => :comments, :action => :index)
    else
      redirect_to url_for(:controller => :comments, :action => :new)
    end
  end

  def show
    @post = Comment.find(params[:id])
    @post_user = @post.user.fname

    if session[:post_id] # if logged in
      @message = "You're now logged in! This is your profile page."
    else
      @message = "You're not logged in yet"
    end
  end

  def edit
    @post = Comment.find(params[:id])
  end

  def update
    @post = Comment.find(params[:id])
    @post.update({
      title: params[:post][:title],
      content: params[:post][:content],
      user_id: params[:post][:user_id],
      post_id: params[:post][:post_id]
    })

    if (@post)
      redirect_to url_for(:controller => :comments, :action => :index)
    else
      redirect_to url_for(:controller => :comments, :action => :edit)
    end
  end

  def destroy
    Comment.delete(params[:id])
    redirect_to url_for(:controller => :comments, :action => :index)
  end
end
