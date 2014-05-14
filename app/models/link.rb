class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :address, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :votes
  has_many :voters, through: :votes   #users

  def votable_by?(user)
    return false if user.nil?
    return false if user == self.user
    return false if voters.include?(user)
    true
  end
end


