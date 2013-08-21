class AdminController < ApplicationController
  #http_basic_authenticate_with :name => Settings.authentication.name, :password => Settings.authentication.password

  def index
  end

  def create
    @pictures = Picture.all
  end

  def order
    @albums = Album.all.select{|a| a.pictures.count > 0}
    @album = Album.find_by_name(params[:album]) if params[:album]
    @pictures = Picture.where("album_id = ?", @album.id) if params[:album]
  end
end
