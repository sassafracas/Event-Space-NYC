class Event < ApplicationRecord
  belongs_to :location
  belongs_to :category
  has_many :user_events
  has_many :users, through: :user_events


  
end
