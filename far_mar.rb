#/far_mar.rb
# gems your project needs
require 'csv'
# our namespace module
module FarMar; end

# all of our data classes that live in the module
require_relative 'lib/farmar_market'
require_relative 'lib/farmar_vendor'
require_relative 'lib/farmar_product'
require_relative 'lib/farmar_sale'

require_relative 'lib/farmar_shared_methods'
# ...require all needed classes

Totoro = FarMar::Market.all?

puts Totoro.length

puts Totoro[0]




# puts FarMar::Market.vendors("1")

puts FarMar::Market.find("1")


# puts FarMar::Market.all?