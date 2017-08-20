class VolumesController < ApplicationController

  def new
    @volume = Volume.new
  end

  def create
    volume_params = params[:volume]

    if Volume.create(:name => volume_params["name"])
      flash[:notice] = "You have successfully added this blog volume!"
      redirect_to blog_path
    else
      flash[:error] = "There was an error adding the blog volume!  Please try again."
      redirect_to new_volume_path
    end
  end
end
