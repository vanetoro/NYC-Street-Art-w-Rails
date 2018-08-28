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
      link_to "Next" , mural.next, class: 'getNextMural'
  end

  def previous_mural(mural)
      link_to 'Previous', mural.previous, class: 'getNextMural'
  end

  def nearby_murals(nearby)
    nearby.murals.map do |mural|
      mural.location_details
    end
  end
end
