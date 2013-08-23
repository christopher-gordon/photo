class Album < ActiveRecord::Base
  has_many :pictures

  attr_accessible :name

  def ordering_list
    pictures.map(&:ordering)
  end
end
