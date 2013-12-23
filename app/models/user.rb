class User < ActiveRecord::Base
  attr_accessible :email, :password, :username
  has_and_belongs_to_many :conversations
  has_one :image, as: :imageable

  validates :username, :password, :email, presence: true
  validates :username, :email, uniqueness: true

  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  class << self
    def authenticate(username, password)
      user = User.where(username: username, password: password)
      if user.blank?
        nil
      else
        user = user.to_a.first
      end
    end
  end
end
