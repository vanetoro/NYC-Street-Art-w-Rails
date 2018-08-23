class NeighborhoodSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :murals
  
end
