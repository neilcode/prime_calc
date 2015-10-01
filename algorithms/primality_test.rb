class PrimalityTest
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

