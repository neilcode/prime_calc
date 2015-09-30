require_relative '../algorithms/brute_force'
require_relative 'calculator'
require_relative 'prime_generator'
require_relative 'table_generator'


primes = PrimeGenerator.new(BruteForce).primes
calculator = Calculator.new(primes)
output = TableGenerator.new(primes, calculator)

output.draw