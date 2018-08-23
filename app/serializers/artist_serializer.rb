class ArtistSerializer < ActiveModel::Serializer
  attributes :artist_name
  has_many :murals
  has_many :neighborhoods, through: :murals
end
