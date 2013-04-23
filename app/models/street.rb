=begin
Checking whether the required information is present in the table,if so it is fetched from the table otherwise
we use google places gem to obtain the details and enter the details to the table.
=end
class Street < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :search, :name ,:address,:original_latitude,:original_longitude
  geocoded_by :address, :if => :address_changed? 
  after_validation :geocode
  has_and_belongs_to_many :user1s
  def self.togetlocation(client,search)
       location = Geocoder.coordinates(client)
       if location.nil?
            return false
       else
  	   lati = location[0].to_f
       longi = location[1].to_f
  	   @alreadyin_table = Street.find_by_sql("select address from streets where search = '#{search}' and abs(streets.original_latitude-#{lati})<=1e6 and abs(streets.original_longitude-#{longi})<=1e6")
     #  render :json=>{:response=> @alreadyin_table}
       if @alreadyin_table.to_a.empty?
          @name_address = Array.new 
          result_place = GooglePlaces::Client.new("AIzaSyD65C4xm3p5lzl9vLkqp08g4dB0nISejqE")
          results = result_place.spots( location[0].to_f, location[1].to_f, :radius=> '3000', :types => search)
          results.length.times do |i|
          @name_address[i] = results[i].name, results[i].vicinity 
         Street.delay.create!(:original_latitude => lati,:original_longitude => longi,:latitude => results[i].lat,:longitude => results[i].lng,:search => search,:name => results[i].name,:address => results[i].vicinity)
            end
          return @name_address
      else
       return @alreadyin_table
   end 
   end   
  end    
end
