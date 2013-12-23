class Message < ActiveRecord::Base
  attr_accessible :content, :read, :read_time
  belongs_to :conversation
  belongs_to :user
  has_one :image, as: :imageable

  validates :content, presence: true
end
