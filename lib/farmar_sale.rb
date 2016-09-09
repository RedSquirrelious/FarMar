require 'csv'
require_relative 'farmar_shared_methods'
require_relative 'farmar_shared_instance_methods'

# FarMar::Sale

# Each sale belongs to a vendor AND a product. The vendor_id and product_id fields refer to the FarMar::Vendor and FarMar::Product ID fields, respectively. The FarMar::Sale data, in order in the CSV, consists of:

# ID - (Fixn	um) uniquely identifies the sale
# Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
# Purchase_time - (Datetime) when the sale was completed
# Vendor_id - (Fixnum) a reference to which vendor completed the sale
# Product_id - (Fixnum) a reference to which product was sold

# For each of the data classes build the following methods:

# [DONE] self.all: returns a collection of instances, representing all of the objects described in the CSV
# [DONE in SharedMethods module] self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.

# Additional FarMar::Sale Methods

#[DONE] vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field

#[DONE] product: returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field

#[DONE] self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments

# require 'chronic'
require 'date'
class FarMar::Sale
	attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id
	
	extend SharedMethods
	include SharedInstanceMethods

	def initialize(details_hash)
		@id = details_hash[:id]
		@amount = details_hash[:amount]
		@purchase_time = details_hash[:purchase_time]
		@vendor_id = details_hash[:vendor_id]
		@product_id = details_hash[:product_id]
	end

#DONE
	def self.all?  #returns a collection of instances, representing all of the objects described in the CSV
		multiple_instances = []

  		CSV.foreach('support/sales.csv', 'r').each do |line|
  			multiple_instances << self.new(id: line[0], amount: line[1].to_i, purchase_time: line[2], vendor_id: line[3], product_id: line[4])
  	
		end
		return multiple_instances
	end

#the find(id) method is shared across all the classes - can be found in the SharedMethods module

#the vendors method is shared across a few classes - can be found in the SharedInstanceMethods module

#the products method is shared across a few classes - can be found in the SharedInstanceMethods module



#DONE
	def self.between(beginning_time, end_time) #returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
		# format = "%m/%-d/%y %H:%M"
		bt = DateTime.parse(beginning_time)
		fbt = bt.strftime('%F %H:%M:%S %Z')
		et = DateTime.parse(end_time)
		fet = et.strftime('%F %H:%M:%S %Z')
		# range = start_date..end_date

		sale_instances = []
		list = FarMar::Sale.all?
		list.each do |sale_instance|
			pt = DateTime.parse(sale_instance.purchase_time)
			fpt = pt.strftime('%F %H:%M:%S %Z')
			
			if (fpt >= fbt) && (fpt <= fet)
				# puts sale_instance.amount
				sale_instances << sale_instance
			end
		end
		puts sale_instances.length.to_s + " sales in that range"
		return sale_instances
	end

	
end
