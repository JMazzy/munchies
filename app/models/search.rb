class Search < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def get_latitude
    (self.latitude * 100).round / 100.00
  end

  def get_longitude
    (self.longitude * 100).round / 100.00
  end
  
end
