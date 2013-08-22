class Album < ActiveRecord::Base
  has_many :pictures

  #TODO spec test
  def ordering_list
    Album.pictures.map(&:ordering)
  end
end
