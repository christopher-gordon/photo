class GalleryController < ApplicationController
  def index
    @albums = Album.all

    album = Album.find_by_name(params[:album]) if params[:album]

    if params[:album]
      @pictures = Picture.where("album_id = ?", album.id)
    else
      @pictures = Picture.all
    end
  end
end
