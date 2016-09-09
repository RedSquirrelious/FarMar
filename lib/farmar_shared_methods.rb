#farmar_shared_methods.rb
require 'csv'

module SharedClassMethods

	def find(id) #returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
	 	# puts "will this work?"
	 	list = self.all?
	 	list.each do |x|
			if x.id == id
				puts "i'm here"
				return x
			end
		end
		return nil
	end


end


# end