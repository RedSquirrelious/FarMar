require 'csv'
require_relative 'farmar_shared_methods'
require_relative 'farmar_shared_instance_methods'
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

#[DONE, TESTED] self.all: returns a collection of instances, representing all of the objects described in the CSV
#[DONE in SharedMethods module, TESTED] self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.

# Additional FarMar::Market Methods

#[DONE] vendors: returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.


# FarMar::Market Methods

# DONE products returns a collection of FarMar::Product instances that are associated to the market through the FarMar::Vendor class.

#DONE self.search(search_term) returns a collection of FarMar::Market instances where the market name or vendor name contain the search_term. For example FarMar::Market.search('school') would return 3 results, one being the market with id 75 (Fox School Farmers FarMar::Market).


#DONE #prefered_vendor: returns the vendor with the highest revenue
# #prefered_vendor(date): returns the vendor with the highest revenue for the given date
#DONE #worst_vendor: returns the vendor with the lowest revenue
# #worst_vendor(date): returns the vendor with the lowest revenue on the given date

module FarMar

	class Market

	extend SharedClassMethods
	include SharedInstanceMethods

		attr_reader :name, :id

			def initialize(details_hash)
				@id = details_hash[:id]
				@name = details_hash[:name]
				@address = details_hash[:address]
				@city = details_hash[:city]
				@county = details_hash[:county]
				@state = details_hash[:state]
				@zip = details_hash[:zip]

			end


#DONE			
		def self.all  #returns a collection of instances, representing all of the objects described in the CSV
			multiple_instances = []
			CSV.foreach('support/markets.csv', 'r') do |line|
				multiple_instances << self.new(id: line[0], name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6])
			end
			return multiple_instances
		end


		def self.search(search_term)
			applicable_item = []
			list = FarMar::Market.all
			list.each do |market|
				if market.name.downcase.include?(search_term.downcase)
					applicable_item << market
				end
			end

			
			if applicable_item.length > 0
				applicable_item.each do |market|
					puts market.name
				end
				
				return applicable_item
			else
				puts "There is no #{self} with that value."
			end


		end

#the find(id) method is shared across all the classes - can be found in the SharedMethods module


#the vendors method is shared across a few classes - can be found in the SharedInstanceMethods module

	def products
		market_products = []
		vendors.each do |market_vendor|
			market_products << market_vendor
		end

		if market_products.length > 0
			market_products.each do |product|
				puts product.name
			end
		end

		return market_products
	end

	def preferred_vendor #returns the vendor with the highest revenue

		vendor_sales = {}
		vendors.each do |market_vendor|
			vendor_sales[market_vendor] = market_vendor.revenue
		end
		
		preferred_vendor = largest_hash_key(vendor_sales)

		return preferred_vendor

	end

	def worst_vendor #returns the vendor with the lowest revenue
	
		vendor_sales = {}
		vendors.each do |market_vendor|
			vendor_sales[market_vendor] = market_vendor.revenue
		end
		
		preferred_vendor = smallest_hash_key(vendor_sales)

		return preferred_vendor
	end

	end
end
