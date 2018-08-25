module ApplicationHelper



  def set_artist_by_id
    @artist = Artist.find(params[:artist_id]) || mural.artist_id
  end





end
