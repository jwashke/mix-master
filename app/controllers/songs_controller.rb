class SongsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @song   = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    redirect_to song_path(@song)
  end

  def index
    if params[:artist_id].nil?
      @songs = Song.sorted
    else
      @artist = Artist.find(params[:artist_id])
      @songs = @artist.songs.sorted
    end
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy
    redirect_to request.referrer
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end
end
