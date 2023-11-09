class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :post

  after_save :update_post_like_counter

  private

  def update_post_like_counter
    post.update(likes_counter: post.likes.count)
  end
end
