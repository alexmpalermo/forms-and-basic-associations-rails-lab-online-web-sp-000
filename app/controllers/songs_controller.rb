class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @genre = Genre.find_by(name: params[:song][:genre_name])
    @artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    @song = Song.new({
      title: params[:song][:title], 
      genre_name: params[:song][:genre_name], 
      artist_name: @artist
      
    })
    @notes = Note.create(content: params[:song][:notes_1])

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end

