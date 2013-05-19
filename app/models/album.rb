class Album < ActiveRecord::Base
  has_many :pictures
end
