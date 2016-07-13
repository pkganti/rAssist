class Location < ActiveRecord::Base
  # attr_accessible :address, :latitude, :longitude
  geocoded_by :name
  after_validation :geocode, :if => :name_changed?

  has_many :users
  has_many :ratings

end
