class Event < ApplicationRecord
  belongs_to :location
  belongs_to :category
  has_many :user_events
  has_many :users, through: :user_events

  def self.sort_by_location
    self.all.sort_by{|event| event.location.neighborhood}
  end

  def self.sort_by_date
    self.all.sort_by {|event| event.date}
  end

  def self.by_neighborhood(neighborhood)
    self.all.select {|event| event.location.neighborhood == neighborhood}
  end

  def self.search(search)
     where("name LIKE ? OR description LIKE ? ", "%#{search}%", "%#{search}%")
  end

  def self.top_five
    self.all.sort_by{|event| event.users.count}[0..4]
  end

end
