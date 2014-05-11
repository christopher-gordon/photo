class AlbumsController < ApplicationController
  def index
    @misc_albums = Album.all.select{|a| a.name == "None" || a.name == 'Frames' || a.name == 'Testing'}
    @albums = (Album.all.sort_by(&:ordering) - @misc_albums)
  end

  def new
    @album = Album.new
  end

  def create
    album_params = params[:album]
    album_params.merge!({ordering: Album.generate_ordering})
    album = Album.new(album_params)

    if album.save(album_params)
      flash[:notice] = "You have created the #{album_params['name']} album!"
    else
      flash[:error] = "There was an error creating this album!"
    end

    redirect_to admin_index_path
  end
end
