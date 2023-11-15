class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user

    @user = Post.find(params[:post_id]).author

    redirect_to user_posts_path(@user)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
