require_relative 'primality_test'

class SixK < PrimalityTest
	# aka the 6k (+ || -) 1 test. moderate improvement over BruteForce
	
	def self.is_prime?(number)
		#get the basic cases out of the way
		if number <= 1
			return false
		elsif number <= 3
			return true
		elsif number % 2 == 0 || number % 3 == 0
			return false
		end

		i = 5

		while i**2 <= number
			return false if number % i == 0 || number % (i + 2) == 0
				
			i += 6
		end

		return true
	end
end