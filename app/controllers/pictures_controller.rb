class PicturesController < ApplicationController
  def index
  end

  def new
    @picture = Picture.new
  end

  def show
    #@picture = 
  end

  def create
    puts "create controller"
    picture_params = params[:picture]

    if Picture.create(picture_params)
      flash[:notice] = "You have added this picture!"
      redirect_to gallery_index_url #TODO: redirect to show page for newly added photo
    else
      flash[:error] = "There was an error adding this picture!"
      redirect_to gallery_index_url #TODO: redirect to pictures new page?
    end
  end

end
