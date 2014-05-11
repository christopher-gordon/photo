class Album < ActiveRecord::Base
  has_many :pictures

  validates_uniqueness_of :name

  attr_accessible :name, :ordering

  def ordering_list
    return [] if pictures.count.zero?
    pictures.map(&:ordering)
  end

  def css_filter_name
    name.downcase.strip.gsub(/ /,'-')
  end

  def self.generate_ordering
    albums = Album.all.sort_by(&:ordering)
    return 0 if albums.map(&:ordering).uniq == [nil]
    albums.reject{|a| a.ordering >= 1000}.last.ordering + 1
  end
end
