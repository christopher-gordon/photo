class PicturesController < ApplicationController
  def index
  end

  def new
    @picture = Picture.new
  end

  def create
    picture = Picture.new

    puts "PARAMS"
    puts params.inspect

    picture.title = params[:picture][:title]
    picture.description = params[:picture][:description]
    picture.location = params[:picture][:location]
    #picture.slideshow
    #file upload

    #picture.save!
    puts picture.inspect
    puts "$$$$$$$$$$$$"

    redirect_to gallery_index_url #TODO: redirect to show page for newly added photo
  end
end
