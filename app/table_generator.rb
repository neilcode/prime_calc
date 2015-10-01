class TableGenerator
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
		@multiples ||= create_multiplication_table
	end
	
	def table_with_headers
		#with the 2D array, add the header row vertically on the 'left' with #zip
		#then horizontally at the top with #unshift
		
		@table_with_headers ||= header.zip(table_data).map(&:flatten).unshift(header)
	end

	private

	def create_multiplication_table
		multiples = []
		number_set = header

		number_set.each do |number|
			row = number_set.each_with_object([]) { |n, arr| arr << (n * number) }
			multiples << row
		end

		multiples
	end	
end