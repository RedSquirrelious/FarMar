# FarMar::Product

# Each product belongs to a vendor. The vendor_id field refers to the FarMar::Vendor ID field. The FarMar::Product data, in order in the CSV, consists of:

# ID - (Fixnum) uniquely identifies the product
# Name - (String) the name of the product (not guaranteed unique)
# Vendor_id - (Fixnum) a reference to which vendor sells this product

# For each of the data classes build the following methods:

#[DONE] self.all: returns a collection of instances, representing all of the objects described in the CSV

#[DONE in SharedMethods module] self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.

# Additional FarMar::Product Methods

#[DONE] sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.

#NOTDONENOTDONENOTDONE number_of_sales: returns the number of times this product has been sold.

#[DONE] self.by_vendor(vendor_id): returns all of the products with the given vendor_id


class FarMar::Product
	extend SharedMethods

	attr_reader :id, :name, :vendor_id


	
	def initialize(details_hash)
		@id = details_hash[:id]
		@name = details_hash[:name]
		@vendor_id = details_hash[:vendor_id]


	end


	def self.all?  #returns a collection of instances, representing all of the objects described in the CSV
		multiple_instances = []

  		CSV.foreach('support/products.csv', 'r').each do |line|
  			multiple_instances << self.new(id: line[0], name: line[1], vendor_id: line[2])
  	
		end
		return multiple_instances
	end


#the find(id) method is shared across all the classes - can be found in the SharedMethods module



#DONE
	def sales #returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
		sale_instances = []
		list = FarMar::Sale.all?
		list.each do |sale_instance|
			if sale_instance.product_id == @id
				# puts sale_instance.amount
				sale_instances << sale_instance
			end
		end
		# puts sale_instances.length.to_s + " sale(s)."
		return sale_instances
	end

#DONE
	def number_of_sales #returns the number of times this product has been sold.
		puts "woo, number of sales"
		sales
		return sales.length

	end

#DONE
	def self.by_vendor(given_vendor_id) #returns all of the products with the given vendor_id
		product_list = []

		list = FarMar::Product.all?
		# puts list.length
		list.each do |item|
			if item.vendor_id == given_vendor_id
				puts item.name
				product_list << item
			end
		end

		puts product_list.length.to_s + " is in that many market(s)."
		return product_list
	end
end

