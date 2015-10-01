require_relative '../algorithms/six_k'
require_relative 'prime_generator'
require_relative 'table_generator'

class App 

	attr_reader :algorithm

	def initialize
		@algorithm = SixK
	end

	def run
		multiplication_table
	end
	
	private

	def requested_primes
		@primes ||= PrimeGenerator.new(algorithm).primes
	end

	def multiplication_table
		@output ||= TableGenerator.new(requested_primes).draw
	end

end
