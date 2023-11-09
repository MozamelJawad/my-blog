class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) # find user by id
    @recent_posts = @user.most_recent_posts(3)
  end
end
