class ArtistsController < ApplicationController
  layout 'logged_in'
  before_action :not_logged_in


  def index
    @artists =Artist.all_artists
  end

  def show
    set_artist
    @mural = Mural.new
    @nextArtist = Artist.next(@artist)
    @previousArtist = Artist.previous(@artist)
    respond_to do |format|
      format.html
      format.json { render json: @artist , status: 200}
    end
      # format.json { render json: { all_data:
      #   { artist: @artist, murals: @murals, nextArtist: @nextArtist,
      #     } , status: 200}
      #   }
  end


  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end



  def edit
    set_artist
  end

  def update
    set_artist
    @artist.update(artist_params)
    redirect_to artist_path(@artist)
  end

  def popular
    @artists = Artist.most_popular
    render :index
  end


  def destroy
    set_artist
    @artist.destroy
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :artist_name, :instagram, :bio)
  end
end
