class Picture < ActiveRecord::Base
  #TODO - migration - remove thumbnail
  belongs_to :album

  attr_accessible :description, :title, :filename, :content_type, :slideshow, :album_id, :ordering

  validates_presence_of :title, :description, :filename, :content_type, :album_id
  validates :filename, :uniqueness => true

  #TODO: move this to album?
  def self.generate_ordering(album)
    ordering = album.ordering_list.sort
    ordering.last + 1
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

    album = Album.find_by_name(params[:album]).id
    picture.album_id = album.id
    picture.ordering = generate_ordering album

    upload(params[:photo_file])

    picture.save!
  end

  private

  def self.valid_params?(params)
    return false if params[:title].nil? || params[:description].nil? || params[:photo_file].nil?
    true
  end

  def self.upload(image)
    File.open(Rails.root.join('app', 'assets', 'images', image.original_filename), 'wb') do |file|
      file.write(image.read)
    end
  end
end
