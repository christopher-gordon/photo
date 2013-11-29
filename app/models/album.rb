class Album < ActiveRecord::Base
  has_many :pictures

  attr_accessible :name

  def ordering_list
    return [] if pictures.count.zero?
    pictures.map(&:ordering)
  end
end
