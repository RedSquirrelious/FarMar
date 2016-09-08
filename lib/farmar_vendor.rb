# FarMar::Vendor

# Each vendor belongs to a market, the market_id field refers to the FarMar::Market ID field. Each vendor has many products for sell. The FarMar::Vendor data, in order in the CSV, consists of:

# ID - (Fixnum) uniquely identifies the vendor
# Name - (String) the name of the vendor (not guaranteed unique)
# No. of Employees - (Fixnum) How many employees the vendor has at the market
# Market_id - (Fixnum) a reference to which market the vendor attends


# For each of the data classes build the following methods:

#[DONE] self.all: returns a collection of instances, representing all of the objects described in the CSV
#[DONE in SharedMethods module] self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.



# Additional FarMar::Vendor Methods

# [DONE] market: returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field

# [DONE] products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.

# [DONE] sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.

#[DONE]  #revenue: returns the the sum of all of the vendor's sales (in cents)

# [DONE] self.by_market(market_id): returns all of the vendors with the given market_id

class FarMar::Vendor
	attr_reader :id, :name, :num_of_employees, :market_id, :vendor_list
	
	extend SharedMethods

	
	def initialize(details_hash)
		@id = details_hash[:id]
		@name = details_hash[:name]
		@num_of_employees = details_hash[:num_of_employees]
		@market_id = details_hash[:market_id]

	end


	def self.all?  #returns a collection of instances, representing all of the objects described in the CSV  ##WORKS
		multiple_instances = []

  		CSV.foreach('support/vendors.csv', 'r').each do |line|
  			multiple_instances << self.new(id: line[0], name: line[1], num_of_employees: line[2], market_id: line[3])
		end
		return multiple_instances
	end
	

#the find(id) method is shared across all the classes - can be found in the SharedMethods module ##WORKS


#DONE
	def market #returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field ##WORKS
		markets = []
		list = FarMar::Market.all?
		list.each do |market|
			if market.id == @market_id
				puts market.name
				markets << market
			end
		end
		puts markets.length.to_s + " market(s).  should be 1!"
		return markets
	end

#DONE
	def products #returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.  ##WORKS 
		product_list = []
		list = FarMar::Product.all?
		list.each do |item|
			if item.vendor_id == @id
				puts item.name
				product_list << item
			end
		end
		# return nil
		puts product_list.length.to_s + " products!"
		return product_list
	end

#DONE
	def sales #returns a collection of FarMar::Sale instances that are associated by the vendor_id field. ##WORKS
		sales_list = []
		list = FarMar::Sale.all?
		list.each do |sale_instance|
			if sale_instance.vendor_id == @id
				puts sale_instance.amount.to_s + " dollars"
				sales_list << sale_instance
			end
		end
		# return nil
		puts sales_list.length.to_s + " sales overall!"
		return sales_list
	end

#DONE
	def revenue #returns the the sum of all of the vendor's sales (in cents) ##WORKS
	 	my_revenue = 0
	 	my_revenue_generators = sales

	 	my_revenue_generators.each do |sale|
	 		my_revenue += sale.amount
	 	end
	 	total_sales_in_cents = my_revenue * 100
	 	puts total_sales_in_cents.to_s + " cents.  can you believe it?"
		return total_sales_in_cents
	end


#DONE
	def self.by_market(given_market_id) #returns all of the vendors with the given market_id
		vendor_list = []

		list = FarMar::Vendor.all?
		# puts list.length
		list.each do |vendor|
			if vendor.market_id.to_i == given_market_id
				puts vendor.name
				vendor_list << vendor
			end
		end

		puts vendor_list.length.to_s + " is in that many market(s)."
		return vendor_list
	end

end

