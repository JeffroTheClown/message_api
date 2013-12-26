require 'bcrypt'

class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  attr_accessible :email, :password, :username, :salt
  has_and_belongs_to_many :conversations
  has_one :image, as: :imageable

  validates :username, :password, :email, presence: true
  validates :username, :email, uniqueness: true

  validates :email, :format => {:with => EMAIL_REGEX}

  before_save :encrypt_password
  after_save :clear_password

  def match_password(login_password)
    password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  class << self
    def authenticate(username, login_password)
      user = User.find_by_username(username)

      if user && user.match_password(login_password)
        return user
      else
        return false
      end
    end
  end

  private
  def encrypt_password
    unless salt.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
end
