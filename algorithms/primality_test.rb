class PrimalityTest
	# base abstract class for the Primality algorithms. 
	# Feeds candidate numbers to #is_prime? and records results if True
	# Stops when the desired number of primes is reached.
	# Example: SixK.get_primes(10)
	# would return the first 10 primes in an array

	def self.get_primes(max_number_of_primes)
		return [] unless max_number_of_primes > 0
		
		primes = [2]
		next_odd_num = 3

		while primes.length < max_number_of_primes
			primes << next_odd_num if is_prime?(next_odd_num)				
			
			next_odd_num += 2
		end

		primes
	end

	def self.is_prime?(number)
		#abstract method overwritten by child classes
		raise NotImplementedError
	end
end

