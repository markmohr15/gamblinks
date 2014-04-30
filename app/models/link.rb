class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :address, presence: true
  belongs_to :user
  has_many :comments

  has_many :votes
  has_many :voters, through: :votes   #users
end
