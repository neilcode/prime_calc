require_relative 'primality_test'

class Fermat < PrimalityTest
	#Fermat's little theorem states:
	# If p is a prime and a is any integer not divisible by p, then a^(p - 1) - 1 is divisible by p.
	# it is probabilistic
	
	def self.is_prime?(number)
		5.times do  #safe to assume a number is prime after 5 tests
			a = rand(2..number-1)
			return false unless (a**(number-1) % number) == 1
		end

		true #...probably!
	end

end


