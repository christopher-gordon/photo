class Picture < ActiveRecord::Base
  #TODO - migration - remove thumbnail
  attr_accessible :description, :title, :filename, :content_type, :location, :slideshow

  #has_one :album #TODO albums

  validates_presence_of :title, :description, :location, :filename, :content_type
  validates :filename, :uniqueness => true

  protected

  def self.create(params)
    return false unless valid_params?(params)

    picture = Picture.new

    picture.title = params[:title]
    picture.description = params[:description]
    picture.location = params[:location]
    picture.content_type = params[:photo_file].content_type
    picture.filename = params[:photo_file].original_filename
    picture.slideshow = (params[:slideshow] == 0 ? false : true)

    upload(params[:photo_file])

    picture.save!
  end

  private

  def self.valid_params?(params)
    return false if params[:title].nil?
    return false if params[:description].nil?
    return false if params[:location].nil?
    return false if params[:photo_file].nil?
  end

  def self.upload(image)
    File.open(Rails.root.join('app', 'assets', 'images', image.original_filename), 'wb') do |file|
      file.write(image.read)
    end
  end

end
