class HomeController < ApplicationController
  skip_before_filter :require_login

  def blog
    @posts = Post.all.sort_by(&:created_at).reverse!
  end

  def index
    @pictures = Picture.where("slideshow = ?", true).sort_by{|p| p.album.ordering}
  end

  def framing
    @pictures = Picture.all.select{|pic| pic.album.name.capitalize == "Frames"}
  end
end
