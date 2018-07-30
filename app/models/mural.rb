class Mural < ApplicationRecord
  belongs_to :artist
  belongs_to :neighborhood

  def neighborhood_attributes=(params)
    if !params[:name].blank?
      neighborhood = Neighborhood.find_or_create_by(name: params[:name].titleize)
      self.neighborhood = neighborhood
    end
end

end
