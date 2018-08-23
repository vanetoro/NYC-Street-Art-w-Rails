module ArtistsHelper


  def next_mural(mural)
    if mural.next
      link_to 'Next', artist_mural_path(@mural.artist, @mural.next) , class: 'nextMural'
    else
      link_to 'Next'
    end
  end

  def previous_mural(mural)
    if !mural.previous.nil?
      link_to 'Previous', artist_mural_path(@mural.artist, @mural.previous), class: 'nextMural'
    else
      link_to 'Previous'
    end
  end
end
