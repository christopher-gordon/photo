class AlbumsController < ApplicationController
  before_filter :get_album, only: [:edit, :update, :destroy]

  def index
    #TODO: centralize the ALBUMS_NOT_FOR_DISPLAY logic
    @misc_albums = Album.all.select{|a| Album::ALBUMS_NOT_FOR_DISPLAY.include?(a.name)}
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

  def update
    puts params
    new_name = params[:album][:name]

    if @album.update_attribute :name, new_name
      flash[:notice] = 'You have successfully updated this album!'

      redirect_to albums_path
    else
      flash[:error] = 'There was a problem with updating this album!'
      redirect_to edit_album_path(@album)
    end
  end

  def destroy
    if @album.destroy
      flash[:notice] = 'You have successfully deleted this album!'

      redirect_to albums_path
    else
      flash[:error] = 'There was a problem with deleting this album!'
      redirect_to edit_picture_path(@picture)
    end
  end

  private

  def get_album
    @album = Album.find(params[:id])
  end
end
