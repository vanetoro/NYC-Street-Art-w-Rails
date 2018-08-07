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
      # , data: { no-turbolink: true }
    end
  end



end
