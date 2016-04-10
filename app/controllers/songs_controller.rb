class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_artist, only: [:new, :create]

  def new
    @song   = @artist.songs.new
  end

  def create
    @song = @artist.songs.create(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @song.update(song_params)
    redirect_to song_path(@song)
  end

  def index
    if params[:artist_id].nil?
      @songs = Song.sorted
    else
      set_artist
      @songs = @artist.songs.sorted
    end
  end

  def destroy
    @song.destroy
    redirect_to request.referrer
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end

  def set_song
    @song = Song.find(params[:id])
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
end
