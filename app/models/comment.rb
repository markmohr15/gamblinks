class Comment < ActiveRecord::Base
  validates :body, presence: true
  belongs_to :user
  belongs_to :link

  has_many :comment_votes
  has_many :comment_voters, through: :comment_votes, :source => :user


  def can_vote?(user)
    return false if user.nil?
    return false if user == self.user
    return false if comment_voters.include?(user)
    true
  end

  def self.top_comments(user)
    where(user_id: user.id).order("comment_votes_count desc").limit(5)
  end

end
