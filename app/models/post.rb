class Post < ActiveRecord::Base
  # REQUIRED_PARAMS = [:title, :body, :
  has_one :picture

  def self.create(options = {})
    # return false unless _valid_params?(params)

    picture = _create_picture_for_post(options)
    #TODO: return if picture == false

    post = Post.new
    post.title = options[:title]
    post.body = options[:body]
    post.picture_id = picture.try(:id)
    post.save
  end

  def picture
    Picture.find(self.picture_id) if self.picture_id
  end

  def self._create_picture_for_post(options)
    options.merge!(:description => "NA", :slideshow => false, :album => "Blog")

    picture_saved = Picture.create(options)
    Picture.last if picture_saved
  end

  # def _valid_params?
  #   return false unless params.
  # end
end
