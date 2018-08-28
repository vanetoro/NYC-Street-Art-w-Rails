class Mural < ApplicationRecord
  belongs_to :artist
  belongs_to :neighborhood
  belongs_to :user, optional: true
  validates :location_details, presence: true
  validates :neighborhood_id, presence: true
  has_one_attached :avatar

  def neighborhood_attributes=(params)
    if !params[:name].blank?
      neighborhood = Neighborhood.find_or_create_by(name: params[:name].titleize)
      self.neighborhood = neighborhood
    end
  end

  def self.ordered_by_hood
    binding.pry
  end

  def next
    mural = Mural.where("id > ?", id).first
    if mural
      mural
    else
      Mural.first
    end
  end




  def previous
    mural = Mural.where("id < ?", id).last
    if mural
      mural
    else
      Mural.last
    end
  end
end
