#farmar_shared_methods.rb
require 'csv'

module SharedMethods

	def find(id) #returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
	 	puts "will this work?"

	 	list = self.all?
	 	list.each do |x|

			if x.id  == id
				puts "i'm here"
				return x
			end
		end
		return nil
	end


	def all?  #returns a collection of instances, representing all of the objects described in the CSV
		multiple_instances = []
  		# class_case = self.class	
  			case 
  			when FarMar::Market
				CSV.foreach('support/markets.csv', 'r') do |line|
  					multiple_instances << self.new(id: line[0], name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6])
				end

  			when FarMar::Vendor
				CSV.foreach('support/vendors.csv', 'r') do |line|
  					multiple_instances << self.new(id: line[0], name: line[1], num_of_employees: line[2], market_id: line[3])
				end

  			when FarMar::Product
				CSV.foreach('support/products.csv', 'r') do |line|
  					multiple_instances << self.new(id: line[0], name: line[1], vendor_id: line[2])
				end

  			when FarMar::Sale
				CSV.foreach('support/sales.csv', 'r') do |line|
  					multiple_instances << self.new(id: line[0], amount: line[1].to_i, purchase_time: line[2], vendor_id: line[3], product_id: line[4])
				end
			end

		return multiple_instances
	end


end