#/far_mar.rb
# gems your project needs
require 'csv'
require 'awesome_print'
require 'chronic'
# our namespace module
module FarMar; end

# all of our data classes that live in the module
require_relative 'lib/farmar_market'
require_relative 'lib/farmar_vendor'
require_relative 'lib/farmar_product'
require_relative 'lib/farmar_sale'

require_relative 'lib/farmar_shared_methods'
# ...require all needed classes


# totoro = FarMar::Market.all?
# puts totoro.length
# puts 'market id is ' + totoro[3].id
# puts totoro[3].name


# puts FarMar::Market.find(cat_bus).name

# puts totoro[3].make_id_string
# puts "now we see a list of vendors"
# puts totoro[3].vendors
# print totoro[3].name.to_s 
# puts " is the market of choice"

# dammit = FarMar::Vendor.all?
# puts 'vendor name is ' + dammit[17].name
# puts 'id is ' + dammit[17].id
# puts 'number of employees is ' + dammit[17].num_of_employees
# puts 'vendor trades at the market with this market id ' + dammit[17].market_id
# puts 'choochoo'
# puts dammit[17].make_id_string
# puts 'choochoo'

# puts 'i think we match ' + totoro[4].name

# dammit[17].market
# dammit[17].products
# puts dammit[17].sales

# check = dammit[17].sales

# money = 0
# check.each do |sale|
# 	money += sale.amount
# end

# puts (money * 100).to_s

# dammit[17].revenue


# puts FarMar::Vendor.by_market(4)


# puts FarMar::Market.all?

#TESTING THE SALE VENDOR
miyazaki = FarMar::Sale.all?
# puts miyazaki.length
# puts miyazaki[2].vendor

# puts miyazaki[2].product

# ap miyazaki[2].purchase_time


# puts miyazaki[0].purchase_time



# deft_time('2013-11-1 00:00:01', '2013-11-2 00:00:01')
# FarMar::Sale.between('11/8/2013 11:00', '11/11/2013 13:00')

# puts Chronic.parse('this saturday')

disney = FarMar::Product.all?

puts disney[0].sales
puts disney[0].number_of_sales


puts FarMar::Product.by_vendor(4)