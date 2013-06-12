class Picture < ActiveRecord::Base
  attr_accessible :description, :filename, :content_type, :location

  has_one :album

  validates_presence_of :title, :description, :location
  validates :filename, :uniqueness => true
end
