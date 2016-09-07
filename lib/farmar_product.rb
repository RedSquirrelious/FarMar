# FarMar::Product

# Each product belongs to a vendor. The vendor_id field refers to the FarMar::Vendor ID field. The FarMar::Product data, in order in the CSV, consists of:

# ID - (Fixnum) uniquely identifies the product
# Name - (String) the name of the product (not guaranteed unique)
# Vendor_id - (Fixnum) a reference to which vendor sells this product

# For each of the data classes build the following methods:

## self.all: returns a collection of instances, representing all of the objects described in the CSV
## self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.

# Additional FarMar::Product Methods

# #vendor: returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field
# #sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
# #number_of_sales: returns the number of times this product has been sold.
# self.by_vendor(vendor_id): returns all of the products with the given vendor_id


class FarMar::Product
	# include SharedMethods

	attr_reader :product_id, :name, :vendor_id, :instance_collector


	
	def initialize(details_hash)
		@product_id = details_hash[:product_id]
		@name = details_hash[:name]
		@vendor_id = details_hash[:vendor_id]


	end

	def self.all?  #returns a collection of instances, representing all of the objects described in the CSV
		multiple_instances = []

  		CSV.foreach('support/products.csv', 'r').each do |line|
  			multiple_instances << self.new(product_id: line[0], name: line[1], vendor_id: line[2])
  	
		end
		return multiple_instances
	end

	

	def self.find(id) #returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
	 	@@instance_collector.each do |x| 
			if x.product_id  == id
				return x
			end
		end
		return nil
	end

#TAKES CSV DATA TO ADD NEW PRODUCTS
	# def self.add_products
	# 	multiple_products = []

 #  		CSV.foreach('support/products.csv', 'r').each do |line|
 #  			multiple_products << self.new(product_id: line[0], name: line[1], vendor_id: line[2])
  	
	# 	end
	# 	return multiple_products
	# end

end
