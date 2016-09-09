require_relative 'spec_helper'
require_relative '../far_mar'



describe 'Testing FarMar' do


#MARKET SPECS
	it 'Must Tell Me if a Market Instance Was Made' do
		bugs_bunny = FarMar::Market.all?
		wabbit = bugs_bunny[50]
		expect( wabbit.class ).must_equal(FarMar::Market)
	end

	it 'Must Return All Market Instances' do
		FarMar::Market.new({id: 789, name: "West Seattle", address: "Somewhere", city: "Seattle", county: "King",state: "WA", zip: 00000})
		expect( FarMar::Market.all?.length ).wont_equal(0)
	end


	it 'Must Return a Market if Given an ID' do
		totoro = FarMar::Market.all?
		cat_bus = totoro[50].id
		neko_basu = totoro[50].name
		expect( FarMar::Market.find(cat_bus).name ).must_equal(neko_basu)
	end

	it 'Must Return the List of Vendors at a Given Market' do
		elmer_fudd = FarMar::Market.all?
		wabbit = elmer_fudd[50]
		expect( wabbit.vendors ).wont_equal(1)
	end

# #PRODUCT SPECS

	it 'Must Assign the Right Information to a New Product' do
		expect( FarMar::Product.new(name: "Thingamajig").name ).must_equal("Thingamajig")
	end

	it 'Must Return All Product Instances' do
		# FarMar::Product.new({product_id: 789, name: "Thingamajig", vendor_id: 1001} )
		expect( FarMar::Product.all?.length ).wont_equal(0)
	end

	it 'Must Show the Number of Sales of a Given Product' do
		rodent = FarMar::Product.all?
		# hamster = rodent[35].id
		guinea_pig = rodent[2]
		expect( guinea_pig.sales ).wont_equal( 0 )
		# expect( guinea_pig.number_of_sales ).wont_equal( 0 )
		expect( guinea_pig.number_of_sales ).must_equal( guinea_pig.sales.length)
	end

	it 'Must Look Up a Products Sales' do
		cat = FarMar::Product.all?
		maine_coon = cat[0]
		expect( maine_coon.sales ).wont_be_empty
		expect( maine_coon.sales[0].class ).must_equal(FarMar::Sale)
	end
 

	 it 'Must Look Up Products Sold by a Given Vendor' do
		bird = FarMar::Vendor.all?
		canary = bird[1].id
		expect( FarMar::Product.by_vendor(canary) ).wont_equal(0)
		expect( FarMar::Product.by_vendor(canary)[0].class).must_equal( FarMar::Product)
	end

# #SALE SPECS

	it 'Must Find Sales that Fall in a Range of Purchase Times' do
#current range of sales are in 2013
		beginning_time = '11/8/3050 11:00' 
		ending_time = '11/11/3050 13:00'
		expect( FarMar::Sale.between(beginning_time, ending_time)).must_be_empty
	end

	it 'Must Return All Sale Instances' do
		instrument = FarMar::Sale.all?
		harp = instrument[42]
		expect( instrument.length ).wont_equal(0)
		expect( harp.class ).must_equal(FarMar::Sale)
	end

	it 'Must Return the Vendor for a Given Sale' do
		melon = FarMar::Sale.all?
		cantaloupe = melon[1000]
		expect( cantaloupe.vendor ).wont_equal(0)
		expect( cantaloupe.vendor[0].class ).must_equal(FarMar::Vendor)
	end

	it 'Must Show the Products Sold in a Given Sale' do
		furniture = FarMar::Sale.all?
		loveseat = furniture[42]
		expect( loveseat.product ).wont_equal(0)
		expect( loveseat.product[0].class ).must_equal( FarMar::Product )
	end


# #VENDOR SPECS

	it 'Must Tell Me if a Vendor Instance Was Made' do
		expect( FarMar::Vendor.new(name: "Stuff and Things LLC").name ).must_equal("Stuff and Things LLC")
	end

	it 'Must Return All Vendor Instances' do
		computer = FarMar::Vendor.all?
		mac = computer[42]
		expect( mac.class ).must_equal( FarMar::Vendor )

	end

	it 'Must Look Up the Vendors that Sell at a Given Market' do
		vegetable = FarMar::Vendor.all?
		carrot = vegetable[100]
		expect( carrot.market ).wont_be_empty
	end

	it 'Must Return Products Sold by a Given Vendor' do
		mineral = FarMar::Vendor.all?
		granite = mineral[300]
		expect( granite.products.length ).wont_equal(0)
		expect (granite.products[0].class ).must_equal( FarMar::Product )
	end

	it 'Must Give the Amount of Total Revenue for a Vendor' do
		fruit = FarMar::Vendor.all? 
		durian = fruit[250]
		range = 0..5000000000000
		expect( range ).must_include( durian.revenue )
	end

	it 'Must Look Up Sales By a Given Vendor' do
		pet = FarMar::Vendor.all?
		chinchilla = pet[42]
		expect( chinchilla.sales ).wont_be_empty
		expect( chinchilla.sales[0].class ).must_equal( FarMar::Sale )
	end

	it 'Must Look Up Products Sold By a Given Vendor' do
		dog = FarMar::Vendor.all?
		sammoyed = dog[42]
		expect( sammoyed.products ).wont_be_empty
		expect( sammoyed.products[0].class ).must_equal(FarMar::Product)
	end

	it 'Must Show All the Vendors Who Sell at a Given Market' do
		holiday = FarMar::Market.all?
		halloween = holiday[42].id
		expect( FarMar::Vendor.by_market(halloween) ).wont_equal(0)
		expect( FarMar::Vendor.by_market(halloween)[0].class ).must_equal( FarMar::Vendor )
	end
	# it 'Must Raise an ArgumentException if given a non-Fixnum' do
	# 	expect( proc { FizzBuzzX::FizzBuzzX.fizzbuzzx("Something") } ).must_raise ArgumentError
	# end
end

