class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :artist_name
  has_many :murals
  # has_many :neighborhoods, through: :murals
end
