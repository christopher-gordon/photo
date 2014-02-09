class HomeController < ApplicationController
  skip_before_filter :require_login

  def index
    @pictures = Picture.where("slideshow = ?", true)
  end
end
