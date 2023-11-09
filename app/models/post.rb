class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }

  after_save :update_user_post_counter

  def most_recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  private

  def update_user_post_counter
    author.update(posts_counter: author.posts.count)
  end
end
