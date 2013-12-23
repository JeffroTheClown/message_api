class Image < ActiveRecord::Base
  attr_accessible :location_path, :url_path
  belongs_to :imageable, polymorphic: true
end