class PicturesController < ApplicationController
  skip_before_filter :require_login, except: [:new, :create, :edit]
  before_filter :get_picture, except: [:new, :create]

  def create
    picture_params = params[:picture]

    if Picture.create(picture_params)
      flash[:notice] = "You have added this picture!"
      redirect_to "/pictures/#{Picture.last.id}"
    else
      flash[:error] = "There was an error adding this picture!"
      redirect_to gallery_index_url #TODO: redirect to pictures new page?
    end
  end

  def update
    new_attributes = params[:picture]

    if @picture.update_picture(new_attributes)
      flash[:notice] = "You have successfully updated this picture!"
      redirect_to(@picture)
    else
      flash[:error] = "There was an error saving your changes!"
      render :edit
    end
  end

  private

  def get_picture
    @picture = Picture.find(params[:id])
  end
end
