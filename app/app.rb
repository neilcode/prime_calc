require_relative '../algorithms/brute_force'
require_relative '../algorithms/six_k'
require_relative '../algorithms/fermat'
require_relative 'prime_generator'
require_relative 'table_generator'

require 'benchmark'
class App 
	# Pulls together the components of the program and executes them with #run
	# options can be provided at instantiation to control output

	attr_reader :benchmark_mode, :algorithm, :range
	def initialize(opts)
		@algorithm 			= opts.fetch(:algorithm, SixK)
		@benchmark_mode = opts.fetch(:benchmark, false)
		@range 					= opts.fetch(:range, 10)
	end

	def run
		if benchmark_mode
			# skip generating a multiplication table at all and instead benchmark the included algorithms
			run_benchmark
		else
			multiplication_table
			# normal operation of the application.
		end				
	end
	
	private

	def requested_primes
		@primes ||= PrimeGenerator.new(algorithm, range).primes
		# get those primes ready for display on the table
	end

	def multiplication_table
		@output ||= TableGenerator.new(requested_primes).draw
		#draw to STDOUT
	end

	def run_benchmark
		all_algorithms = ObjectSpace.each_object(Class).select{|klass| klass.superclass == PrimalityTest}
		#grab all primality tests descended from the base class
		test_nums = (3..10000).step(2).to_a

		all_algorithms.each do |algorithm|
			time = Benchmark.realtime do
  			test_nums.each { |n| algorithm.is_prime?(n)}
			end
			puts "Testing #{algorithm}:"
			puts "Time elapsed #{time*1000} milliseconds"
		end
	end
end
