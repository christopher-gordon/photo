class PicturesController < ApplicationController
  def index
  end

  def new
    @picture = Picture.new
  end

  def show
  end

  def create
    picture = Picture.new

    puts "PARAMS"
    puts params.inspect

    picture.title = params[:picture][:title]
    picture.description = params[:picture][:description]
    picture.location = params[:picture][:location]
    #picture.slideshow   #boolean
    #upload params[:picture][:photo_file]
    #upload params[:picture][:thumbnail_file]

    picture.save!
    puts picture.inspect
    puts "$$$$$$$$$$$$"

    redirect_to gallery_index_url #TODO: redirect to show page for newly added photo
  end

  private

  def upload(image)
    File.open(Rails.root.join('public', 'uploads', image.original_filename), 'w') do |file|
      file.write(image.read)
    end
  end

end
