class Volume < ActiveRecord::Base
  has_many :posts
  validates_presence_of :name

  def css_filter_name
    name.downcase.strip.gsub(/ /,'-')
  end

  def has_posts?
    posts.size > 0
  end
end
