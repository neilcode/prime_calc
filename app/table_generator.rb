class TableGenerator
	# simple multiplication table generator that creates a table of 
	# length A by height A given an array of length A
	#
	# Example: TableGenerator.new([1,2,3,4,5]).draw
	# Will produce:
	#    1  2  3  4  5
	# 1  1  2  3  4  5
	# 2  2  4  6  8  10
	# 3  3  6  9  12 15
	# 4  4  8  12 16 20
	# 5  5  10 15 20 25

	attr_reader :header

	def initialize(number_array)
		@header = number_array
	end

	def draw
		table_with_headers.each_with_index do |row, index|
			print "\t" if index == 0 #nudge the header row over for alignment

			row.each do |cell|
				print "#{cell}\t"
			end
			
			print "\n"
		end
	end

	def table_data
		# memoize this data so calling it more than once
		# doesn't require re-running calculations on static data.
		# generates the products of all permutations of the contents 
		# of the array passed into the object
		@multiples ||= create_multiplication_table
	end
	
	def table_with_headers
		# with the 2D array of multiples, add the numbers we generated it with back into
		# the table as a vertical column on the left side using #zip. 
		# then add the same numbers as a "header row"
	
		@table_with_headers ||= header.zip(table_data).map(&:flatten).unshift(header)
	end

	private

	def create_multiplication_table
		# create an 2D array. each element is an array that represents a row of the table
		multiples = []
		number_set = header

		number_set.each do |number|
			row = number_set.each_with_object([]) { |n, arr| arr << (n * number) }
			multiples << row
		end

		multiples
	end	
end