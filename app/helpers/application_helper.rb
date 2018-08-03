module ApplicationHelper

  def instagram(artist)
    if !artist.instagram.blank?
      link_to 'Instagram', "https://www.instagram.com/#{artist.instagram}", :target => "_blank"
    end
  end


  def set_artist_by_id
    @artist = Artist.find(params[:artist_id]) || mural.artist_id
  end





end
