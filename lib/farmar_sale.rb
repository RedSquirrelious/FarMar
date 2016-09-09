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

#DONE
	def vendor #returns a collection of FarMar::Vendor instances that are associated with the sale by the vendor_id field.
		vendor_instances = []
		list = FarMar::Vendor.all?
		list.each do |vendor_instance|
			if vendor_instance.id == @vendor_id
				puts vendor_instance.name
				vendor_instances << vendor_instance
			end
		end
		puts vendor_instances.length.to_s + " market(s).  should be 1!"
		return vendor_instances
	end

#DONE
	def product #returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
		product_instances = []
		list = FarMar::Product.all?
		list.each do |product_instance|
			if product_instance.id == @product_id
				puts product_instance.name
				product_instances << product_instance
			end
		end
		puts product_instances.length.to_s + " product(s)."
		return product_instances
	end

	# def format_time(beginning_time, end_time)
	# 	# 2013-11-07 04:34:56 -0800
	# 	format = "%y-%m-%d %H:%M:%S"
	# 	beginning_time = DateTime.strptime(beginning_time, format)
	# 	end_time = DateTime.strptime(end_time, format)
	# end


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
