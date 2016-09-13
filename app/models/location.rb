class Location < ActiveRecord::Base
  # attr_accessible :address, :latitude, :longitude
  geocoded_by :name
  after_validation :geocode, :if => :name_changed?

  has_and_belongs_to_many :users


end
