class HomeController < ApplicationController
  skip_before_filter :require_login

  def blog
    @posts = Post.all.sort_by(&:created_at).reverse!
    @volumes = Volume.all.select(&:has_posts?).sort_by(&:created_at)
    @last_volume = @volumes.try(:last)
  end

  def framing
    @pictures = Picture.all.select{|pic| pic.album.name.capitalize == "Frames"}
  end

  def index
    @pictures = Picture.where("slideshow = ?", true).sort_by{|p| p.album.ordering}
  end
end
