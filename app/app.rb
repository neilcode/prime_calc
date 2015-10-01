require_relative '../algorithms/brute_force'
require_relative '../algorithms/trial_division'
require_relative '../algorithms/fermat'
require_relative 'calculator'
require_relative 'prime_generator'
require_relative 'table_generator'

class App 

	attr_reader :benchmark_mode, :algorithm, :range

	def initialize(opts)
		@algorithm 			= opts.fetch(:algorithm, Fermat)
		@benchmark_mode = opts.fetch(:benchmark, false)
		@range 					= opts.fetch(:range, 10)
	end

	def run
		if benchmark_mode
			#benchmark shit
		else
			multiplication_table
		end				
	end
	
	private

	def requested_primes
		@primes ||= PrimeGenerator.new(algorithm, range).primes
	end

	def multiplication_table
		@output ||= TableGenerator.new(requested_primes).draw
	end

end
