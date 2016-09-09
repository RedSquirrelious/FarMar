#farmar_shared_methods.rb
require 'csv'

module SharedMethods

	def find(id) #returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
	 	# puts "will this work?"

	 	list = self.all?
	 	list.each do |x|
			if x.id  == id
				puts "i'm here"
				return x
			end
		end
		return nil
	end

	# def make_id_string
	# 	id = @id.to_i
	# 	return id.to_s 
	# end


	# def vendors #returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
	# 	 	# puts "will this work?"

	#  	list = Vendor.all?
	#  	vendor_list = []
	#  	list.each do |x|
	# 		if x.id  == self.vendor_id
	# 			puts "i'm here"
	# 			return x
	# 		else
	# 			return nil
	# 		end
	# 		vendor_list << x
	# 	end
	# 	return vendor_list
	# end

end


# # #TRYING TO DRY OUT THE LOOKUP PORTION WITH CASES #failing at it ;(

# 		# test_class = self.class

# 		# csv_file = case test_class
# 		# 	when FarMar::Market then'support/markets.csv'
# 		# 	when FarMar::Vendor then 'support/vendors.csv'
# 		# 	when FarMar::Product then 'support/products.csv'
# 		# 	when FarMar::sales then 'support/sales.csv'
# 		# end

# # 		details_hash = case test_class
# # 		when FarMar::Market then id: line[0]} name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6]
# # 		end


# 	def all?  #returns a collection of instances, representing all of the objects described in the CSV
# 		test_class = self.class

# 		test_class = case csv_file
# 			when FarMar::Market then support/markets.csv
# 			when FarMar::Vendor then support/vendors.csv
# 			when FarMar::Product then support/products.csv
# 			when FarMar::Sale then support/sales.csv
# 		end


# 	# 	multiple_instances = []
# 	# 	CSV.foreach(csv_file, 'r') do |line|
# 			multiple_instances << self.new(id: line[0], name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6])
# 		end
# 	# 	return multiple_instances
# 	# end

# 		def self.vendors(id) #returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
# 			csv_file

# 		 	CSV.foreach(csv, 'r').each do |line| 
# 		 	# 	case
# 		 	# 	when FarMar::Market, FarMar::Sale
# 		 	# 		line_num = line[3]
# 		 	# 	when FarMar::Product
# 		 	# 		line_num = line[2]
# 		 	# 	end
# 				# # puts line [3]
			
# 				if line[3]  == id
# 					# print line
# 					return line
# 				end
# 			end
# 			return nil
# 		end

# 		def self.vendors(id) #returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.

# 		 	CSV.foreach('support/vendors.csv', 'r').each do |line| 
# 				# puts line [3]
# 				if line[3]  == id
# 					# print line
# 					return line
# 				end
# 			end
# 			return nil
# 		end


# end