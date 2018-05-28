class Location < ApplicationRecord
  has_many :events
  has_many :categories, through: :events
end
