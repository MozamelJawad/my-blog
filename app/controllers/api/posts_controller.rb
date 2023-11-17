class Api::PostsController < ApplicationController
  def index
    @posts = current_user.posts
    render json: @posts
  end
end
