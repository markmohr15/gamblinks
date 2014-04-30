class User < ActiveRecord::Base
  has_many :links
  has_many :comments
  has_many :votes
  has_many :voted_on_links, through: :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
