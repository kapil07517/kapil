require 'net/http'
class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @artists = Artist.all
    respond_with(@artists)
  end

  def show
    artist_profile_image(@artist) if !@artist.image_url
    respond_with(@artist)
  end

  def new
    @artist = Artist.new
    respond_with(@artist)
  end

  def edit
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    respond_with(@artist)
  end

  def update
    @artist.update(artist_params)
    respond_with(@artist)
  end

  def destroy
    @artist.destroy
    respond_with(@artist)
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name)
    end
    
    def artist_profile_image(artist)
      source = "https://randomuser.me/api/"
      resp = Net::HTTP.get_response(URI.parse(source))
      data = resp.body
      result = JSON.parse(data)
      img = result["results"][0]["picture"]["thumbnail"]
      artist.image_url = img
      artist.save
    end
end
