class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    #instance variable holds all comments
  end

  def new
    @message = "Post a comment"
    @comment = Comment.new(post_id: params[:post_id])
    #instance variable holds new comment
  end

  def create
    @new_comment = Comment.create(
      content: params[:comment][:content],
      user_id: params[:comment][:user_id],
      post_id: params[:comment][:post_id]
    )
    #creates new comment based on comment parameters

    if @new_comment
      # redirect_to url_for(:controller => :comments, :action => :index)
      redirect_to '/posts' + @new_comment.post.id.to_s
    else
      redirect_to url_for(:controller => :comments, :action => :new)
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @comment_user = @comment.user.fname

    if session[:post_id] # if logged in
      @message = "You're now logged in! This is your profile page."
    else
      @message = "You're not logged in yet"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    #finds comment by parameters
    @comment = Comment.find(params[:id])
    # updates comment by parameters
    @comment.update({
      content: params[:comment][:content],
      user_id: params[:comment][:user_id],
      comment_id: params[:comment][:post_id]
    })

    #redirects if there's a comment
    if (@comment)
      redirect_to url_for(:controller => :comments, :action => :index)
    else
      redirect_to url_for(:controller => :comments, :action => :edit)
    end
  end

  def destroy
    puts "Hello" + Comment.find(params[:id]).post.id.to_s
    Comment.delete(params[:id])
    redirect_to url_for(:controller => :comments, :action => :index)
    #method should delete comments
  end
end
