require 'RMagick' #TODO REMOVE?

class Picture < ActiveRecord::Base
  include Magick

  #TODO - migration - remove thumbnail
  belongs_to :album

  attr_accessible :description, :title, :filename, :content_type, :slideshow, :album_id, :ordering, :cloudinary_url, :cloudinary_public_id

  validates_presence_of :title, :filename, :album_id
  validates_uniqueness_of :filename, :cloudinary_url

  #TODO: move this to album?
  def self.generate_ordering(album)
    return 0 if album.ordering_list.empty?
    ordering = album.ordering_list.sort
    ordering.last + 1
  end

  def thumbnail_name
    filename.gsub(/.jpg/, "_thumb.jpg")
  end

  def update_picture(new_attributes)
    album = Album.find_by_name(new_attributes.delete('album'))
    update_attributes(new_attributes.merge!({album_id: album.id}))
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
    picture.slideshow = params[:slideshow] == "1"

    album = Album.find_by_name(params[:album])
    picture.album_id = album.id
    picture.ordering = generate_ordering album

    #not needed after Cloudinary is used
    #upload(params[:photo_file])

    return false unless picture.save

    response = Cloudinary::Uploader.upload(params[:photo_file])

    #no thumbnail creation for now
    #create_thumbnail(params[:photo_file])

    picture.cloudinary_url = response["url"]
    picture.cloudinary_public_id = "#{response["public_id"]}.#{response["format"]}"
    picture.save
  end

  def self.remove_from_cloudinary(cloudinary_public_id)
    public_id = cloudinary_public_id.split("\.").first
    Cloudinary::Uploader.destroy(public_id)
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
