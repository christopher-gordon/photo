class HomeController < ApplicationController
  def index
    @pictures = Picture.where("slideshow = ?", true)
  end
end
