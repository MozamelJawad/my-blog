class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :post

  validates :text, presence: true

  after_save :update_post_comment_counter

  private

  def update_post_comment_counter
    post.update(comments_counter: post.comments.count)
  end
end
