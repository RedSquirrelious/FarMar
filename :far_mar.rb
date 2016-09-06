#/far_mar.rb
# gems your project needs
require 'csv'
require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'


# our namespace module
module FarMar; end

# all of our data classes that live in the module
require 'lib/farmar_market'
require 'lib/farmar_vendor'
require 'lib/farmar_product'
require 'lib/farmar_sale'
# ...require all needed classes