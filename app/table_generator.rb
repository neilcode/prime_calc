require_relative 'calculator' 

class TableGenerator

	attr_reader :header

	def initialize(numbers)
		@header = numbers
		@calculator = Calculator.new(numbers)
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

	def table_with_headers
		#with the 2D array, add the header row vertically on the 'left' with #zip
		#then horizontally at the top with #unshift
		
		@table_with_headers ||= header.zip(display_data).map(&:flatten).unshift(header)
	end

	private

	def display_data
		@data ||= calculator.data
	end

	def calculator
		@calculator
	end
	
end