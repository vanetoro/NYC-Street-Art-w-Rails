class Neighborhood < ApplicationRecord
  has_many :murals
  has_many :artists, through: :murals
  validates :name, presence: true


  def self.all_hoods
    self.all.order(name: :asc)
  end

  def self.top_hoods
    joins(:murals).group(:neighborhood_id).order('count(murals.neighborhood_id)desc').limit(3)
  end

  def self.nearby(mural)
    self.all.where("id = ?", mural.neighborhood_id).first
  end


end
