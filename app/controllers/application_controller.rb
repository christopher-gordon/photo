class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login
  before_filter :clear_gallery_session, except: [:set_gallery_session, :get_gallery_session]

  def set_gallery_session
    cookies[:gallery] = params[:gallery]
    render nothing: true
  end

  def get_gallery_session
    render json: { previousGallery: cookies[:gallery] }
  end

  private

  def not_authenticated
    redirect_to login_path, alert: "You must be logged in to access that page!"
  end

  def clear_gallery_session
    cookies.delete(:gallery)
  end
end
