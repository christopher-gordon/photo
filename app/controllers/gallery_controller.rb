class GalleryController < ApplicationController
  skip_before_filter :require_login
  skip_before_filter :clear_gallery_session

  def index
    @albums = Album.all.select{|a| a.pictures.count > 0}.reject{|a| a.name == "None" || a.name == 'Frames' || a.name == 'Testing'}.sort_by(&:ordering)
    @album = Album.find_by_name(params[:album]) if params[:album]
    @pictures = Picture.where("album_id = ?", @album.id) if params[:album]
  end
end
