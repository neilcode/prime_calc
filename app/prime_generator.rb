class PrimeGenerator
	# responsible for generating prime numbers from a primality algorithm and preparing them for viewing
  # Example: PrimeGenerator.new(Fermat, 30).primes
  # gives the first 30 prime numbers using Fermat's Little Theorem
  # You can also run PrimeGenerator.new(Fermat) to default to 10 primes only using Fermat
  
	attr_reader :range_requested, :algorithm

	def initialize(algorithm, num_of_primes = nil)
		@range_requested = adjust_range(num_of_primes)
    @total_primes = range_requested.max + 1
	  @algorithm = algorithm
  end

  def primes
  	@primes ||= algorithm.get_primes(@total_primes) #get primes up to n primes
    @primes[range_requested] #return only the primes that were requested
                             #in case we were wanting to view a subset of primes 1 to n
  end

  private

  def adjust_range(num_of_primes)
    # convert natural language "show me 1..10 primes" to counting by zero since we have an array.
    # if nothing was passed, just default to 0-9. 
    new_range = case
                when num_of_primes.is_a?(Integer)
                  (0..(num_of_primes - 1))
                when num_of_primes.is_a?(Range)
                  ((num_of_primes.min - 1)..(num_of_primes.max - 1))
                else
                  (0..9)
                end

    # don't want to accidentally request (-1..n-1) if someone passed -range:0-10 in the command line
    # like a coder would
    new_range.min < 0 ? (0..new_range.max) : new_range
  end
end
