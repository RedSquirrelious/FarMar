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

	# def all?(thing)  #returns a collection of instances, representing all of the objects described in the CSV
	# 	multiple_instances = []

 #  		CSV.foreach("support/#{thing}.csv", 'r') do |line|
 #  			multiple_instances << self.new(id: line[0], name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6])
  	
	# 	end
	# 	return multiple_instances
	# end



end