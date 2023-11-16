class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts.includes(:comments) if @user
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(params[:user_id])
    if @post.destroy
      @post.author.decrement!(:posts_counter)
      redirect_to user_posts_path(@user), notice: 'Post was successfully deleted.'
    else
      redirect_to user_posts_path(@user), alert: 'Error deleting post.'
    end
  end
end
