class PrimeGenerator
	
	attr_reader :range_requested, :last_prime

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

  def primes
  	@primes ||= algorithm.get_primes(range_requested.max)
    @primes[adjusted_range]
  end

  private

  def algorithm
  	@algorithm
  end

  def adjusted_range
    #just in case the user who requested the range was counting from 0 like a good programmer should.
    min = range_requested.min - 1
    min = 0 if min < 0
    max = range_requested.max - 1

    (min..max)
  end
end
