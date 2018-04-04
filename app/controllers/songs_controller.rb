class SongsController < ApplicationController
  def index
    @top_songs = Song.top
  end
end
