class Album < ActiveRecord::Base
  belongs_to :collection
  has_many :pictures

  validates_uniqueness_of :name

  attr_accessible :name

  def ordering_list
    return [] if pictures.count.zero?
    pictures.map(&:ordering)
  end

  def css_filter_name
    name.downcase.strip.gsub(/ /,'-')
  end

end
