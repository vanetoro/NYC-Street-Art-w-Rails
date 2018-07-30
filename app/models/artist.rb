class Artist < ApplicationRecord
  has_many :murals
  has_many :neighborhoods, through: :murals
end
