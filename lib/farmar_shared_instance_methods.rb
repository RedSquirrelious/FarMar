#farmar_shared_instance_methods.rb

# For Each Data Class:

# Write additional rspec tests for any methods in the data classes that don't already have test coverage.
# self.find_by_x(match): where x is an attribute, returns a single instance whose x attribute (case-insensitive) equals the match parameter. For instance, FarMar::Vendor.find_by_name("windler inc") could find a FarMar::Vendor with name attribute "windler inc" or "Windler Inc".
# self.find_all_by_x(match): works just like find_by_x but returns a collection containing all possible matches. For example FarMar::Market.find_by_state("WA") could return all of the FarMar::Market objects with "WA" in their state field.

require 'csv'

module SharedInstanceMethods

	def products #returns a collection of FarMar::Product instances that are associated by the FarMar::Product or FarMar::Sale vendor_id field.  ##WORKS 

		raise ArgumentError.new('This object cannot do that') if (self.class != FarMar::Vendor && self.class != FarMar::Sale)
		product_list = []
		list = FarMar::Product.all
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


	def sales #returns a collection of FarMar::Sale instances that are associated by the vendor_id field. ##WORKS

		sales_list = []
		list = FarMar::Sale.all
		list.each do |sale_instance|
			if sale_instance.vendor_id == @id
				# puts sale_instance.amount.to_s + " dollars"
				sales_list << sale_instance
			end
		end
		# return nil
		# puts sales_list.length.to_s + " sales overall!"
		return sales_list
	end

	def largest_hash_key(hash)
  			hash.max_by{|k,v| v}.first
	end

	def smallest_hash_key(hash)
  			hash.min_by{|k,v| v}.first
	end


	def vendors #returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.

		vendor_list = []
		list = FarMar::Vendor.all
		list.each do |vendor|
			if vendor.market_id == @id
				# puts vendor.name
				vendor_list << vendor
			end
		end
		return vendor_list
	end



end