require_relative '../algorithms/brute_force'
require_relative '../algorithms/trial_division'
require_relative '../algorithms/fermat'
require_relative 'prime_generator'
require_relative 'table_generator'

require 'benchmark'
class App 

	attr_reader :benchmark_mode, :algorithm, :range
	

	def initialize(opts)
		@algorithm 			= opts.fetch(:algorithm, Fermat)
		@benchmark_mode = opts.fetch(:benchmark, false)
		@range 					= opts.fetch(:range, 10)
	end

	def run
		if benchmark_mode
			run_benchmark
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

	def run_benchmark
		all_algorithms = ObjectSpace.each_object(Class).select{|klass| klass.superclass == PrimalityTest}
		test_nums = (3..10000).step(2).to_a

		all_algorithms.each do |algorithm|
			time = Benchmark.realtime do
  			test_nums.each { |n| algorithm.is_prime?(n)}
			end
			puts "Testing #{algorithm}"
			puts "Time elapsed #{time*1000} milliseconds"
		end
	end
end
