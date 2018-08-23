class MuralSerializer < ActiveModel::Serializer
  attributes :id, :location_details, :neighborhood
  belongs_to :neighborhood
  belongs_to :artist
end
