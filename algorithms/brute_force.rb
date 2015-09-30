class BruteForce
	# brute force algorithm to check primality with recursion. Not efficient!
	def self.get_primes(max_number_of_primes)
		primes = [2]
		next_odd_num = 3

		while primes.length < max_number_of_primes
			primes << next_odd_num if is_prime?(next_odd_num)				
			
			next_odd_num += 2
		end

		primes
	end

	def self.is_prime?(number, divisor = nil)
		divisor ||= number - 1
		return true if divisor == 1

		if number % divisor == 0
			return false
		else
			is_prime?(number, (divisor - 1))
		end
	end
end	