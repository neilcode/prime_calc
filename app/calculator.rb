class Calculator
	#creates a multiplication table from a set of numbers
	attr_reader :number_set

	def initialize(data)
		data = data.map(&:to_i) if data[0].is_a?(String)
		@number_set = data
	end

	def data
		# memoize this data so calling it more than once
		# doesn't require re-running calculations on static data.
		@multiples ||= create_multiplication_table
	end

	private

	def create_multiplication_table
		multiples = []

		number_set.each do |number|
			row = number_set.each_with_object([]) { |n, arr| arr << (n * number) }
			multiples << row
		end

		multiples
	end


end