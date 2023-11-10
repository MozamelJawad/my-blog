class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @like = @post.likes.build(author: @user)
    if @like.save
      redirect_to user_posts_path(@user)
    else
      redirect_to user_posts_path(@ser), alert: 'Error creating like.'
    end
  end
end
