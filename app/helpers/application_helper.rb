module ApplicationHelper

  def instagram(artist)
    if !artist.instagram.blank?
      link_to 'Instagram', "https://www.instagram.com/#{artist.instagram}", :target => "_blank", id: 'instagram'
    end
  end

  def show_next_artist(artist)
    if !artist.nil?
      link_to 'Next', artist_path(@nextArtist), class: "nextArtist", data:{id: @nextArtist.id}
    end
  end

  def set_artist_by_id
    @artist = Artist.find(params[:artist_id]) || mural.artist_id
  end





end
