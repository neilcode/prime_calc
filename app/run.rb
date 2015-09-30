require_relative '../algorithms/brute_force'
require_relative '../algorithms/trial_division'
require_relative 'calculator'
require_relative 'prime_generator'
require_relative 'table_generator'


primes = PrimeGenerator.new(TrialDivision).primes
calculator = Calculator.new(primes)
output = TableGenerator.new(primes, calculator)

output.draw