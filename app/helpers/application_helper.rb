module ApplicationHelper

  def instagram(artist)
    if !artist.instagram.nil?
      link_to 'Instagram', artist.instagram, :target => "_blank"
    end
  end


end
