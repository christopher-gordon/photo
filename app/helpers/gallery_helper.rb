module GalleryHelper
  def title_text(album)
    if album.nil?
      "Gallery"
    else
      @album.name
    end
  end
end
