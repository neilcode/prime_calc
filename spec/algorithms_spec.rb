require 'rspec'
require_relative '../algorithms/brute_force'
require_relative '../algorithms/six_k'
require_relative '../algorithms/fermat'

algorithms = [BruteForce, SixK, Fermat]

algorithms.each do |algorithm|
	describe algorithm do

		describe '#get_primes' do
			context 'with number of primes at 5' do
				it 'returns an array of 5 elements' do 
					expect(algorithm.get_primes(5).count).to eq 5
				end

				it 'outputs the first 5 primes in existence' do
					expect(algorithm.get_primes(5)).to eq [2,3,5,7,11]
				end

			end

			context 'with number of primes set to 10' do
				
				it 'returns an array of 10 elements' do
					expect(algorithm.get_primes(10).count).to eq 10
				end

				it 'outputs the first 10 primes in existence' do
					expect(algorithm.get_primes(10)).to eq [2,3,5,7,11,13,17,19,23,29]
				end
			
			end

			context 'with number of primes set to 100' do
				it 'outputs the first 100 primes in existence' do
					first_100 = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67,
											 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149,
											 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 
											 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 
											 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 
											 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 
											 503, 509, 521, 523, 541]

				  expect(algorithm.get_primes(100)).to eq(first_100)
				end
			end

			context 'with number of primes set to 0' do
				it 'returns an empty array' do 
					expect(algorithm.get_primes(0)).to be_empty
				end
			end
		end
	end
end