require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :get_recent_album
  before_action :recent_albums
  
  def get_recent_album
    @rec_album = Album.order("released_on").last
  end
  
  def recent_albums
    @recent_albums = Album.order("released_on").limit(4)
  end
end
