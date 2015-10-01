require_relative 'primality_test'

class BruteForce < PrimalityTest
	# brute force algorithm to check primality with recursion. Not efficient!
	def self.is_prime?(number, divisor = nil)
		divisor ||= number / 2
		return true if divisor == 1

		if number % divisor == 0
			return false
		else
			is_prime?(number, (divisor - 1))
		end
	end
end	