# FarMar::Vendor

# Each vendor belongs to a market, the market_id field refers to the FarMar::Market ID field. Each vendor has many products for sell. The FarMar::Vendor data, in order in the CSV, consists of:

# ID - (Fixnum) uniquely identifies the vendor
# Name - (String) the name of the vendor (not guaranteed unique)
# No. of Employees - (Fixnum) How many employees the vendor has at the market
# Market_id - (Fixnum) a reference to which market the vendor attends


# For each of the data classes build the following methods:

## self.all: returns a collection of instances, representing all of the objects described in the CSV
## self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.



# Additional FarMar::Vendor Methods

# #market: returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
# #products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
# #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
# #revenue: returns the the sum of all of the vendor's sales (in cents)
# self.by_market(market_id): returns all of the vendors with the given market_id

class FarMar::Vendor
	attr_reader :vendor_id, :name, :num_of_employees, :market_id, :instance_collector

	@@instance_collector = []
	
	def initialize(details_hash)
		@vendor_id = details_hash[:vendor_id]
		@name = details_hash[:name]
		@num_of_employees = details_hash[:num_of_employees]
		@market_id = details_hash[:market_id]

		@@instance_collector << self
	end

	def self.all?  #returns a collection of instances, representing all of the objects described in the CSV
		multiple_instances = []

  		CSV.foreach('support/vendors.csv', 'r').each do |line|
  			multiple_instances << self.new(vendor_id: line[0], name: line[1], num_of_employees: line[2], market_id: line[3])
		end
		return multiple_instances
	end
	end

	def self.find(id) #returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
	 	@@instance_collector.each do |x| 
			if x.vendor_id  == id
				return x
			end
		end
		return nil
	end
#TAKES CSV DATA TO ADD NEW VENDORS
	# def self.add_vendors
	# 	multiple_instances = []

 #  		CSV.foreach('support/vendors.csv', 'r').each do |line|
 #  			multiple_instances << self.new(vendor_id: line[0], name: line[1], num_of_employees: line[2], market_id: line[3])
	# 	end
	# 	return multiple_instances
	# end

end

