module PicturesHelper
  def back_to_gallery_or_album_copy
    if @album.name.downcase == 'frames'
      "Back to Frames"
    elsif @album.name.downcase == 'blog'
      "Back to Blog"
    elsif cookies[:gallery].present?
      "Back to #{@album.name}"
    else
      "Back to Gallery"
    end
  end

  def previous_page_path
    case @album.name.downcase
    when "frames"
      framing_path
    when "blog"
      blog_path
    else
      gallery_index_path
    end
  end
end
