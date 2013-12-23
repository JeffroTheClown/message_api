class Conversation < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :users
  has_many :messages

  validates :name, presence: true

  def is_member?(user)
    self.users.each do |conversation_user|
      return true if conversation_user.id == user.id
    end
    false
  end
end
