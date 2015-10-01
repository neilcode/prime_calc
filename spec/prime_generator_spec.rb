require 'rspec'
require_relative '../app/prime_generator'
require_relative '../algorithms/brute_force'

describe PrimeGenerator do
	describe 'Instantiation' do
		it 'requires a recipe object' do
			expect { PrimeGenerator.new }.to raise_error(ArgumentError)
		end
	end


	describe '#primes' do
		before do
			@algorithm = double('BruteForce')
		end
	
		context 'with no additional arguments' do
			it 'generates the first 10 prime numbers by default' do
				allow(@algorithm).to receive(:get_primes).with(10) { [2,3,5,7,11,13,17,19,23,29] }
				
				generator = PrimeGenerator.new(@algorithm)
				expect(generator.primes).to eq([2,3,5,7,11,13,17,19,23,29])
			end
		
		end
		
		context 'with an Integer N passed as a argument' do
			
			it 'generates primes up to the Nth prime' do
				allow(@algorithm).to receive(:get_primes).with(11) { [2,3,5,7,11,13,17,19,23,29,31] }

				generator = PrimeGenerator.new(@algorithm, 11)
				expect(generator.primes).to eq([2,3,5,7,11,13,17,19,23,29,31])
			end
	
		end

		context 'with a Range (N..M) passed as a argument' do
	
			it 'returns the Nth to Mth primes' do
				range = (3..5)
				allow(@algorithm).to receive(:get_primes).with(5) { [2,3,5,7,11,13] }

				generator = PrimeGenerator.new(@algorithm, range)
				expect(generator.primes).to eq([5,7,11])
			end
	
		end
	end
end