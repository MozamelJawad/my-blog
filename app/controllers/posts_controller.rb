class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts if @user # if there is a user, show only their posts
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:id])
  end
end
