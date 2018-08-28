class MuralSerializer < ActiveModel::Serializer
  attributes :id, :location_details, :neighborhood, :active
  belongs_to :neighborhood
  belongs_to :artist
end
