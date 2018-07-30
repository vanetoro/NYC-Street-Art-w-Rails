class Mural < ApplicationRecord
  belongs_to :artist
  belongs_to :neighborhood
  has_nested_attriburtes_for :neighborhood, reject_if => :all_blank
end
