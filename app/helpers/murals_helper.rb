module MuralsHelper

  def active?(mural)
    if mural.active == 1
      "Mural is still up!"
    else
      "Mural is no longer visible :("
    end
  end

  def image(mural)
    if mural.avatar.attached?
      image_tag mural.avatar
    end
  end


  def next_mural(mural)
    if mural.next
      link_to "More by #{@mural.artist.artist_name}" , artist_mural_path(@mural.artist, @mural.next) , class: 'nextMural'
    else
      link_to 'Next'
    end
  end

  def previous_mural(mural)
    if !mural.previous.nil?
      link_to 'Previous', artist_mural_path(@mural.artist, @mural.previous), class: 'nextMural'
    else
      tag.a 'Previous', class: 'nextMural'
    end
  end

  def nearby_murals(nearby)
    nearby.murals.map do |mural|
      mural.location_details
    end
  end
end
