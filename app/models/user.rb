class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :posts, foreign_key: 'author_id', dependent: :delete_all
  has_many :likes, foreign_key: 'author_id', dependent: :delete_all
  has_many :comments, foreign_key: 'author_id', dependent: :delete_all
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_most_recent_posts
    posts.limit(3)
  end

  def admin?
    @role = 'admin'
  end
end
