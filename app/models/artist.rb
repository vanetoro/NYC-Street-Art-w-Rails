class Artist < ApplicationRecord
  has_many :murals
  has_many :neighborhoods, through: :murals
  validates :name, presence: true
  validates :artist_name, presence: true
  validates :bio, presence: true

  def self.all_artists
    self.all.order(artist_name: :asc)
  end

  def self.most_popular
    joins(:murals).group(:artist_id).order('count(murals.artist_id)desc').limit(5)
  end

  def self.next(artist)
    self.where("id > ?", artist.id).first
  end

  def self.previous(artist)
    self.where("id < ?", artist.id).first
  end

end
