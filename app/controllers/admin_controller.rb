class AdminController < ApplicationController
  http_basic_authenticate_with :name => Settings.authentication.name, :password => Settings.authentication.password

  def index
  end
end
