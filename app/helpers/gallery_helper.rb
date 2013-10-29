module GalleryHelper
  def thumbnail_name(filename)
    f = filename.gsub(/.jpg/, "_thumb.jpg")
  end
end
