class Picture < ActiveRecord::Base
  #TODO - migration - remove thumbnail
  attr_accessible :description, :title, :filename, :content_type, :slideshow

  #has_one :album #TODO albums
  belongs_to :album

  validates_presence_of :title, :description, :filename, :content_type
  validates :filename, :uniqueness => true

  protected

  def self.create(params)
    puts "params"
    puts params.inspect
    return false unless valid_params?(params)

    puts "made it here"

    picture = Picture.new

    picture.title = params[:title]
    picture.description = params[:description]
    #picture.location = params[:location]
    picture.content_type = params[:photo_file].content_type
    picture.filename = params[:photo_file].original_filename
    picture.slideshow = (params[:slideshow] == 0 ? false : true)

    upload(params[:photo_file])

    picture.save!
  end

  private

  def self.valid_params?(params)
    return false if params[:title].nil? || params[:description].nil? || params[:photo_file].nil?
    #return false if params[:location].nil?
    true
  end

  def self.upload(image)
    File.open(Rails.root.join('app', 'assets', 'images', image.original_filename), 'wb') do |file|
      file.write(image.read)
    end
  end

end
