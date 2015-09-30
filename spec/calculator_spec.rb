require 'rspec'
require_relative '../calculator.rb'

describe Calculator do
	describe 'initialization' do
		
		it 'accepts an array of integers' do 
			expect { @calc = Calculator.new([1,2,3]) }.to_not raise_error
		end

		it 'accepts an array of stringified integers and converts them' do
			@calc = Calculator.new(%w(1 2 3))
			expect(@calc.number_set).to eq [1,2,3]
		end
	
	end

	describe '#data' do
		before do
			@calc = Calculator.new([2,4,6,8,10])
			@output = @calc.data
		end
		
		it 'returns an array of integer arrays' do
			expect(@output.first).to be_a(Array)
			expect(@output.first.first).to be_a(Integer)
		end

		it 'multiples[x][y] is the product of number_set[x] * number_set[y]' do
			@number_set = @calc.number_set
			
			@number_set.each_with_index do |num, i|
				other_num = @number_set.sample
				other_num_index = @number_set.index(other_num)

				expect(@output[i][other_num_index]).to eq (num * other_num)
			end
		end
	end
end