require 'RMagick'

class Picture < ActiveRecord::Base
  include Magick

  #TODO - migration - remove thumbnail
  belongs_to :album

  attr_accessible :description, :title, :filename, :content_type, :slideshow, :album_id, :ordering

  validates_presence_of :title, :description, :filename, :content_type, :album_id
  validates_uniqueness_of :filename

  #TODO: move this to album?
  def self.generate_ordering(album)
    return 0 if album.ordering_list.empty?
    ordering = album.ordering_list.sort
    ordering.last + 1
  end

  def thumbnail_name
    filename.gsub(/.jpg/, "_thumb.jpg")
  end

  protected

  def self.create(params)
    return false unless valid_params?(params)

    picture = Picture.new

    picture.title = params[:title]
    picture.description = params[:description]
    #picture.location = params[:location]
    picture.content_type = params[:photo_file].content_type
    picture.filename = params[:photo_file].original_filename
    picture.slideshow = (params[:slideshow] == 0 ? false : true)

    album = Album.find_by_name(params[:album])
    picture.album_id = album.id
    picture.ordering = generate_ordering album

    #not needed after Cloudinary is used
    #upload(params[:photo_file])

    response = Cloudinary::Uploader.upload(params[:photo_file])
    puts "RESPONSE FROM CLOUDINARY"
    puts response


    #no thumbnail creation for now
    #create_thumbnail(params[:photo_file])

    picture.save!
  end

  private

  def self.valid_params?(params)
    return false if params[:title].nil? || params[:description].nil? || params[:photo_file].nil?
    true
  end

  def self.upload(image)
    File.open(Rails.root.join('public', 'assets', image.original_filename), 'wb') do |file|
      file.write(image.read)
    end
  end

  def self.create_thumbnail(uploaded_image)
    filename = uploaded_image.original_filename
    image = Image.read(Rails.root.join('app', 'assets', 'images', uploaded_image.original_filename)).first
    thumbnail = image.thumbnail(0.099)
    thumb_name = filename.gsub(/.jpg/, "_thumb.jpg")

    File.open(Rails.root.join('app', 'assets', 'images', thumb_name), 'wb') do |file|
      file.write(thumbnail)
    end
  end
end
