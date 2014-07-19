module PicturesHelper
  def back_to_gallery_or_album_copy
    if @album.name.downcase == 'frames'
      "Back to Frames"
    elsif cookies[:gallery].present?
      "Back to #{@album.name}"
    else
      "Back to Gallery"
    end
  end
end
