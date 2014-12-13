class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  has_many  :posts
  has_many  :comments

  has_many  :votes

  def restrict_voting
    self.restrict_voting = false
  end
end
