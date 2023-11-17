class Api::CommentsController < ApplicationController
skip_before_action :verify_authenticity_token
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end
end
