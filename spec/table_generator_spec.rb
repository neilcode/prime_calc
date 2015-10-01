require 'rspec'
require_relative '../app/table_generator'

describe TableGenerator do
	describe 'Instantiation' do
		it 'accepts a header row in the form of an array' do
			expect { TableGenerator.new([1,2,3]) }.to_not raise_error
		end
	end

	describe "#table_data" do
		before do
			@number_set = [1,2,3,4,5]
			@output = TableGenerator.new(@number_set).table_data
		end

		it 'returns an array of integer arrays' do
			expect(@output.first).to be_a(Array)
			expect(@output.first.first).to be_a(Integer)
		end

		it 'table_data[x][y] is the product of number_set[x] * number_set[y]' do
			@number_set.each_with_index do |num, i|
				other_num = @number_set.sample
				other_num_index = @number_set.index(other_num)

				expect(@output[i][other_num_index]).to eq (num * other_num)
			end
		end
	end

	describe '#table_with_headers' do
		
		before do 
			@header_row = [9,9,9]
			@table = TableGenerator.new(@header_row)
		end

		it 'returns an array of arrays' do
			expect(@table.table_with_headers).to be_a(Array)
			expect(@table.table_with_headers[0]).to be_a(Array)
		end

		it 'the first row of the table is the "header row"' do
			expect(@table.table_with_headers.first).to eq(@header_row)
		end

		it 'the first column is also the "header row"' do
			output = @table.table_with_headers[1..-1]
			output.each_with_index {|row, index| expect(row[0]).to eq(@header_row[index])}
		end
	end
end
