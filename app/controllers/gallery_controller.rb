class GalleryController < ApplicationController
  skip_before_filter :require_login
  skip_before_filter :clear_gallery_session

  def index
    @albums = Album.all.select{|a| a.pictures.count > 0}.reject{|a| Album::ALBUMS_NOT_FOR_DISPLAY.include?(a.name)}.sort_by(&:ordering)
    @album = Album.find_by_name(params[:album]) if params[:album]
    @pictures = Picture.where("album_id = ?", @album.id) if params[:album]
  end

  def reset
    cookies.delete(:gallery)
    redirect_to gallery_index_path
  end
end
