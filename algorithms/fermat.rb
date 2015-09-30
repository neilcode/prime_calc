require_relative 'primality_test'

class Fermat < PrimalityTest

	def self.is_prime?(number)
		10.times do  #safe to assume a number is prime after 10 tests
			a = rand(2..number-1)
			return false unless (a**(number-1) % number) == 1
		end

		true #...probably
	end

end


