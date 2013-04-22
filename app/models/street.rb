=begin
Checking whether the required information is present in the table,if so it is fetched from the table otherwise
we use google places gem to obtain the details and enter the details to the table.
=end
class Street < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :Search, :name ,:address,:original_latitude,:original_longitude
  geocoded_by :address, :if => :address_changed? 
  after_validation :geocode
  def self.togetlocation(client,search)
       location = Geocoder.coordinates(client)
       if location.nil?
            return false
       else
  	   lati = location[0].to_f
       longi = location[1].to_f
  	   alreadyin_table = Street.find_by_sql(%Q(select address from streets where Search = 'search' and abs(original_latitude-'lati'<=1e6) && abs(original_longitude-'longi'<=1e6)))
       if alreadyin_table.to_a.empty?
          name_address = Array.new 
          result_place = GooglePlaces::Client.new("AIzaSyD65C4xm3p5lzl9vLkqp08g4dB0nISejqE")
          results = result_place.spots( location[0].to_f, location[1].to_f, :radius=> '1500', :types => search)
          results.length.times do |i|
          name_address[i] = results[i].name, results[i].vicinity 
         Street.delay.create!(:original_latitude => lati,:original_longitude => longi,:latitude => results[i].lat,:longitude => results[i].lng,:Search => search,:name => results[i].name,:address => results[i].vicinity)
            end
          return name_address
      else
       return alreadyin_table
   end 
   end   
  end    
end
