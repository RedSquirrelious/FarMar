#farmar_shared_instance_methods.rb

require 'csv'

module SharedInstanceMethods

	def products #returns a collection of FarMar::Product instances that are associated by the FarMar::Product or FarMar::Sale vendor_id field.  ##WORKS 
		# my_id = self.send[:id]
		raise ArgumentError.new('This object cannot do that') if (self.class != FarMar::Vendor && self.class != FarMar::Sale)
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


	def sales #returns a collection of FarMar::Sale instances that are associated by the vendor_id field. ##WORKS
		raise ArgumentError.new('This object cannot do that') if (self.class != FarMar::Vendor && self.class != FarMar::Product)
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


	def vendors #returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
		raise ArgumentError.new('This object cannot do that') if (self.class != FarMar::Market && self.class != FarMar::Sale)
		vendor_list = []
		list = FarMar::Vendor.all?
		list.each do |vendor|
			if vendor.market_id == @id
				puts vendor.name
				vendor_list << vendor
			end
		end
		return vendor_list
	end

end