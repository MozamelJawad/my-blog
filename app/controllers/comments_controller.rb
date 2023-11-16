class CommentsController < ApplicationController
  load_and_authorize_resource

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

    if @comment.save
      redirect_to user_posts_path(@user), notice: 'Comment was successfully created.'
    else
      redirect_to user_posts_path(@user), alert: 'Error creating comment.'
    end
  end

  def destroy
    @user = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:post_id])
    @comment = Comment.find_by_id(params[:id])

    if @comment.destroy
      @comment.post.decrement!(:comments_counter)
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully deleted.'
    else
      redirect_to user_post_path(@user, @post), alert: 'Error deleting comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
