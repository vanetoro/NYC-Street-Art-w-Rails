module ArtistsHelper

  def instagram(artist)
    if !artist.instagram.blank?
      link_to 'Instagram', "https://www.instagram.com/#{artist.instagram}", :target => "_blank", id: 'instagram'
    end
  end

  def show_next_artist(artist)
    if !artist.nil?
      content_tag(:a, 'Next', class: "pointer", id: "nextArtist", data:{id: @nextArtist.id})
    else
      content_tag(:a, 'Previous', class: "pointer", id: "previousArtist", data:{id: @previousArtist.id})
    end
  end

end
