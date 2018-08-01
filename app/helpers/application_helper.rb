module ApplicationHelper

  def instagram(artist)
    if !artist.instagram.blank?
      link_to 'Instagram', "https://www.instagram.com/#{artist.instagram}", :target => "_blank"
    end
  end

  def image(mural)
    if mural.avatar.attached?
      image_tag mural.avatar.variant(resize: "50X50")
    end
  end

  def set_artist_by_id
    @artist = Artist.find(params[:artist_id]) || mural.artist_id
  end

  def active?(mural)
    if mural.active == 1
      'Mural is currently on display'
    else
      "No longer available"
    end
  end

end
