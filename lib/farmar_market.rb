# FarMar::Market

# Each individual market has many vendors associated with it. The FarMar::Market data, in order in the CSV, consists of:

# ID - (Fixnum) a unique identifier for that market
# Name - (String) the name of the market (not guaranteed unique)
# Address - (String) street address of the market
# City - (String) city in which the market is located
# County - (String) county in which the market is located
# State - (String) state in which the market is located
# Zip - (String) zipcode in which the market is located

# For each of the data classes build the following methods:

### self.all: returns a collection of instances, representing all of the objects described in the CSV
### self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.

# Additional FarMar::Market Methods

# vendors: returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.

class FarMar::Market
	attr_reader :name, :market_id, :instance_collector

	@@instance_collector = []
	
	def initialize(details_hash)
		@market_id = details_hash[:market_id]
		@name = details_hash[:name]
		@address = details_hash[:address]
		@city = details_hash[:city]
		@county = details_hash[:county]
		@state = details_hash[:state]
		@zip = details_hash[:zip]
		@@instance_collector << self
	end

	def self.all?  #returns a collection of instances, representing all of the objects described in the CSV
		return @@instance_collector
	end

	def self.find(id) #returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
	 	@@instance_collector.each do |x| 
			if x.market_id  == id
				return x
			end
		end
		return nil
	end



	def vendors #returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
	end


end