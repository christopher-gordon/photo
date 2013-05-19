class Picture < ActiveRecord::Base
  attr_accessible :description, :filename, :content_type, :location

  has_one :album

  validates :description, :content_type, :location, :prescence => true
  validates :filename, :uniqueness => true
end
