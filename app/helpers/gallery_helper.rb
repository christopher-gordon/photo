module GalleryHelper
  def thumbnail_name(filename)
    f = filename.gsub(/.jpg/, "_thumb.jpg")
  end

  def index_within_album(picture)
    @album.pictures.index(picture) + 1
  end

  def previous_picture
    @album.pictures[index_within_album(@picture) - 2]
  end

  def next_picture
    @album.pictures[index_within_album(@picture)]
  end

  def first_picture?
    index_within_album(@picture) == 1
  end

  def last_picture?
    index_within_album(@picture) == @album.pictures.size
  end

  def display_hashmark?
    index_within_album(@picture) != 1 && index_within_album(@picture) != @album.pictures.size
  end
end
