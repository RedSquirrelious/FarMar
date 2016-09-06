# "Write a method that takes a number as a parameter and for most numbers it returns the same number as a String. But for multiples of three return “Fizz” instead of the number and for the multiples of five return “Buzz”. For numbers which are multiples of both three and five return “FizzBuzz”. Everything is returned as a String"

require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'

require_relative '../lib/farmar'


# REQUIREMENTS
# Cases where the number is not divisible by 3 or 5.
# Cases where the number is divisible by 3 and not 5
# Cases where the number is divisible by 5 and not 3
# Cases where the number is divisible by both 3 & 5.

#expect(Module::Class:method)

describe 'Testing FarMar' do

	it 'Must Return "Fizz" for multiples of 3 and not multiples of 5' do
		expect( FizzBuzzX::FizzBuzzX.fizzbuzzx(3) ).must_equal("Fizz")
		expect( FizzBuzzX::FizzBuzzX.fizzbuzzx(6) ).must_equal("Fizz")
		expect( FizzBuzzX::FizzBuzzX.fizzbuzzx(36) ).must_equal("Fizz")
	end

	it 'Must Raise an ArgumentException if given a non-Fixnum' do
		expect( proc { FizzBuzzX::FizzBuzzX.fizzbuzzx("Something") } ).must_raise ArgumentError
	end

	it 'Must Return "Buzz" for multiples of 5 and not multiples of 3' do
		expect( FizzBuzzX::FizzBuzzX.fizzbuzzx(5) ).must_equal("Buzz")
		expect( FizzBuzzX::FizzBuzzX.fizzbuzzx(25) ).must_equal("Buzz")
		expect( FizzBuzzX::FizzBuzzX.fizzbuzzx(50) ).must_equal("Buzz")
	end



	it 'Must Return the number a String for numbers not divisible or 3 and 5' do
		expect( FizzBuzzX::FizzBuzzX.fizzbuzzx(1) ).must_equal('1')
		expect( FizzBuzzX::FizzBuzzX.fizzbuzzx(67) ).must_equal('67')
		expect( FizzBuzzX::FizzBuzzX.fizzbuzzx(7) ).must_equal('7')
	end

	it 'Must Return "FizzBuzz" for numbers divisible by 3 and 5' do
		expect( FizzBuzzX::FizzBuzzX.fizzbuzzx(15) ).must_equal("FizzBuzzX")
		expect( FizzBuzzX::FizzBuzzX.fizzbuzzx(30) ).must_equal("FizzBuzzX")
		expect( FizzBuzzX::FizzBuzzX.fizzbuzzx(60) ).must_equal("FizzBuzzX")
	end

end