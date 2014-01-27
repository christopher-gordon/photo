class GalleryController < ApplicationController
  def index
    @albums = Album.all.select{|a| a.pictures.count > 0}.reject{|a| a.name == "None"}

    @album = Album.find_by_name(params[:album]) if params[:album]

    @pictures = Picture.where("album_id = ?", @album.id) if params[:album]
  end
end
