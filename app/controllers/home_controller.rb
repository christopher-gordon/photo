class HomeController < ApplicationController
  skip_before_filter :require_login

  def index
    @pictures = Picture.where("slideshow = ?", true)
  end

  def framing
    @pictures = Picture.all.select{|pic| pic.album.name.capitalize == "Frames"}
  end
end
