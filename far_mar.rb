#/far_mar.rb
# gems your project needs
require 'csv'
require 'awesome_print'
# require 'chronic'
# our namespace module
module FarMar; end

# all of our data classes that live in the module
require_relative 'lib/farmar_market'
require_relative 'lib/farmar_vendor'
require_relative 'lib/farmar_product'
require_relative 'lib/farmar_sale'

require_relative 'lib/farmar_shared_methods'
require_relative 'lib/farmar_shared_instance_methods'
# # ...require all needed classes

ruby = FarMar::Market.all

# puts ruby[42].id
# puts ruby[42].name
# puts ruby[42].vendors.length 
# puts ruby[42].preferred_vendor.name
# puts ruby[42].worst_vendor.name

puts ruby[42].products

# FarMar::Market.search('school')


# coriander = FarMar::Vendor.all

# puts coriander[4].id
# puts coriander[4].name
# puts coriander[4].products
# puts coriander[4].sales

# salamander = FarMar::Sale.all

# puts salamander[0].id
# puts salamander[0].amount
# puts salamander[0].products
# # puts salamander[0].sales

# cylinder = FarMar::Product.all

# puts cylinder[0].id
# puts cylinder[0].name
# puts cylinder[0].sales[0].amount.to_s + "is how much someone spent"
# # puts cylinder[42].vendors

# puts FarMar::Product.find(43).name

		# totoro = FarMar::Market.all
		# cat_bus = totoro[50].id
		# puts cat_bus
		# neko_basu = totoro[50].name
		# puts neko_basu
		# puts FarMar::Market.find(cat_bus)




