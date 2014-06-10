class PicturesController < ApplicationController
  skip_before_filter :require_login, except: [:new, :create, :edit, :update, :destroy]
  skip_before_filter :clear_gallery_session
  before_filter :get_picture, except: [:new, :create]

  def show
    @album = Album.find_by_name(session[:gallery])
  end

  def new
    @picture = Picture.new
  end

  def create
    picture_params = params[:picture]

    if Picture.create(picture_params)
      flash[:notice] = 'You have added this picture!'
      redirect_to(Picture.last)
    else
      flash[:error] = 'There was an error adding this picture!'
      redirect_to gallery_index_url #TODO: redirect to pictures new page?
    end
  end

  def update
    new_attributes = params[:picture]

    if @picture.update_picture(new_attributes)
      flash[:notice] = 'You have successfully updated this picture!'
      redirect_to(@picture)
    else
      flash[:error] = 'There was an error saving your changes!'
      render :edit
    end
  end

  def destroy
    cloudinary_public_id = @picture.cloudinary_public_id

    if @picture.destroy
      flash[:notice] = 'You have successfully deleted this picture!'

      response = Picture.remove_from_cloudinary(cloudinary_public_id)
      flash[:error] = 'The picture was deleted but there was a problem removing it from Cloudinary!' if response == {"result"=>"not found"}

      redirect_to admin_index_url
    else
      flash[:error] = 'There was a problem with deleting this picture!'
      redirect_to edit_picture_path(@picture)
    end
  end

  private

  def get_picture
    @picture = Picture.find(params[:id])
  end
end
