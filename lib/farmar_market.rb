require 'csv'
require_relative 'farmar_shared_methods'
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
module FarMar



	class Market
	extend SharedMethods
		attr_reader :name, :id, :vendor_id


		
		def initialize(details_hash)
			@id = details_hash[:id]
			@name = details_hash[:name]
			@address = details_hash[:address]
			@city = details_hash[:city]
			@county = details_hash[:county]
			@state = details_hash[:state]
			@zip = details_hash[:zip]

		end

		# def self.all?  #returns a collection of instances, representing all of the objects described in the CSV
		# 	return @@instance_collector
		# end

		# def self.find(id) #returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
		#  	@@instance_collector.each do |x| 
		# 		if x.market_id  == id
		# 			return x
		# 		end
		# 	end
		# 	return nil
		# end

	#TAKES CSV DATA TO ADD NEW MARKETS
		# def self.add_markets
		# 	multiple_markets = []

	 #  		CSV.foreach('support/markets.csv', 'r') do |line|
	 #  			multiple_markets << self.new(id: line[0], name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6])
	  	
		# 	end
		# 	return multiple_markets
		# end

		def self.all?  #returns a collection of instances, representing all of the objects described in the CSV
			multiple_instances = []

				CSV.foreach('support/markets.csv', 'r') do |line|
				multiple_instances << self.new(id: line[0], name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6])

				end
			return multiple_instances
		end

		def self.vendors(id) #returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.

		 	CSV.foreach('support/vendors.csv', 'r').each do |line| 
				# puts line [3]
				if line[3]  == id
					puts "i'm in the loop!"
					print line
				end
			end
			return nil
		end


	end
end

# Totoro = FarMar::Market.add_markets

# puts Totoro.length