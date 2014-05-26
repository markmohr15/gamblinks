class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :address, presence: true
  validates :address, uniqueness: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes
  has_many :voters, through: :votes, :source => :user  #users
  after_commit :send_email, :on => :create

  def votable_by?(user)
    return false if user.nil?
    return false if user == self.user
    return false if voters.include?(user)
    true
  end

  def self.top_links(user)
    where(user_id: user.id).order("votes_count desc").limit(5)
  end

  def send_email

  end

end


