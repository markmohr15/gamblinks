class User < ActiveRecord::Base
  validates :username, uniqueness: true
  has_many :links, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voted_on_links, through: :votes, dependent: :destroy

  has_many :followed_users, through: :relationships, source: :followed
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower


  has_many :comment_votes, dependent: :destroy
  has_many :voted_on_comments, through: :comment_votes, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def followed?(user)
    return false if followers.include?(user)
    true
  end

  def follow_relationship_for(user)
    relationships.find_by(followed_id: user.id)
  end





end


