class AdminController < ApplicationController
  #http_basic_authenticate_with :name => Settings.authentication.name, :password => Settings.authentication.password

  def index
  end

  def create
    @pictures = Picture.all
  end

end
