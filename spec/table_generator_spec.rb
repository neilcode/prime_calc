require 'rspec'
require_relative '../app/table_generator'

describe TableGenerator do
	describe 'Instantiation' do
		it 'accepts a header row in the form of an array' do
			expect { TableGenerator.new([1,2,3]) }.to_not raise_error
		end
	end

	describe '#table_with_headers' do
		
		before do 
			@calc = double('Calculator')
			@header_row = ['a','b','c']
			allow(@calc).to receive(:data) { [[1,2,3], [3,4,5], [6,7,8]]}
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
