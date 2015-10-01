class PrimeGenerator
	
	attr_reader :range_requested

	def initialize(algorithm, num_of_primes = nil)
		@range_requested = case
											 when num_of_primes.is_a?(Integer)
											   (1..num_of_primes)
											 when num_of_primes.is_a?(Range)
											   num_of_primes
											 else
												 (1..10)
											 end

	  @algorithm = algorithm
  end

  def algorithm_used
  	algorithm.class.to_s
  end

  def primes
  	@primes ||= algorithm.get_primes(range_requested.max)
  	
  	@primes[(range_requested.min - 1)..(range_requested.max - 1)]
  end

  private

  def algorithm
  	@algorithm
  end
end
