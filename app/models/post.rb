class Post < ApplicationRecord
  after_save :update_post_counter
  after_destroy :decrement_post_counter
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  validates :title, presence: true, length: { maximum: 100 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def decrement_post_counter
    author.decrement!(:posts_counter)
  end

  def recent_comments
    comments.limit(5)
  end
end
