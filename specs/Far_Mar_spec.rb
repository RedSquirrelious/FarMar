require_relative 'spec_helper'
require_relative '../far_mar'



describe 'Testing FarMar' do


#MARKET SPECS
	it 'Must Tell Me if a Market Instance Was Made' do
		expect( FarMar::Market.new(name: "Ballard").name ).must_equal("Ballard")
	end

	it 'Must Return All Market Instances' do
		FarMar::Market.new({market_id: 789, name: "West Seattle", address: "Somewhere", city: "Seattle", county: "King",state: "WA", zip: 00000})
		expect( FarMar::Market.all?.length ).wont_equal(0)
	end

	it 'Must Look Up the Name of a Market if Given an ID' do
		FarMar::Market.new({market_id: 123, name: "Ballard", address: "Somewhere", city: "Seattle", county: "King",state: "WA", zip: 00000})
		expect( FarMar::Market.find(123).name ).must_equal("Ballard")
	end



#PRODUCT SPECS

	it 'Must Assign the Right Information to a New Product' do
		expect( FarMar::Product.new(name: "Thingamajig").name ).must_equal("Thingamajig")
	end

	it 'Must Return All Product Instances' do
		FarMar::Product.new({product_id: 789, name: "Thingamajig", vendor_id: 1001} )
		expect( FarMar::Product.all?.length ).wont_equal(0)
	end

	it 'Must Look Up the Name of a Product if Given an ID' do
		FarMar::Product.new({product_id: 789, name: "Thingamajig", vendor_id: 1001} )
	expect( FarMar::Product.find(789).name ).must_equal("Thingamajig")
	end
 
#SALE SPECS

	it 'Must Create New Sale' do
		expect( FarMar::Sale.new(purchase_time: 1300).purchase_time ).must_equal(1300)
	end
	it 'Must Return All Sale Instances' do
		FarMar::Sale.new({sale_id: 789, amount: 25, purchase_time: 1200, vendor_id: 1001, product_id: 789})
		expect( FarMar::Sale.all?.length ).wont_equal(0)
	end

	it 'Must Look Up the Amount of a Sale if Given an ID' do
		FarMar::Sale.new({sale_id: 1953, amount: 25, purchase_time: 1200, vendor_id: 1001, product_id: 789})
	expect( FarMar::Sale.find(1953).amount).must_equal(25)
	end

#VENDOR SPECS

	it 'Must Tell Me if a Vendor Instance Was Made' do
		expect( FarMar::Vendor.new(name: "Stuff and Things LLC").name ).must_equal("Stuff and Things LLC")
	end

	it 'Must Return All Vendor Instances' do
		FarMar::Vendor.new({vendor_id: 1001, name: "Stuff and Things LLC", num_of_employees: 2, market_id: 123})
		expect( FarMar::Vendor.all?.length ).wont_equal(0)
	end

	it 'Must Look Up the Number of a Vendor\'s Employees if Given an ID' do
		FarMar::Vendor.new({vendor_id: 1001, name: "Stuff and Things LLC", num_of_employees: 2, market_id: 123})
	expect( FarMar::Vendor.find(1001).num_of_employees ).must_equal(2)
	end
	# it 'Must Raise an ArgumentException if given a non-Fixnum' do
	# 	expect( proc { FizzBuzzX::FizzBuzzX.fizzbuzzx("Something") } ).must_raise ArgumentError
	# end

end