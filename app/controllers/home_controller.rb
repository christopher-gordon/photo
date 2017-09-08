class HomeController < ApplicationController
  skip_before_filter :require_login

  def blog
    @posts = Post.all.sort_by(&:created_at).reverse! # TODO: kill?
    @volumes = Volume.all.select(&:has_posts?).sort_by(&:created_at)
    volume_id = params[:volume].to_i
    if volume_id > 0
      @current_volume = Volume.find_by_id(volume_id)
    else
      @current_volume = @volumes.try(:last)
    end
  end

  def framing
    @pictures = Picture.all.select{|pic| pic.album.name.capitalize == "Frames"}
  end

  def index
    @pictures = Picture.where("slideshow = ?", true).sort_by{|p| p.album.ordering}
  end
end
