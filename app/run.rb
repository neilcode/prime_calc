# The entrypoint to the application. Starts with a set of default settings which 
# can be modified by passing arguments at the command line.

require_relative 'app'

OPTIONS = {
	benchmark: false,
	range: 10,
	algorithm: SixK
}

ALGORITHMS = {
	'-bf' => BruteForce,
	'-k'  => SixK,
	'-f'  => Fermat
}

def parse_args
	OPTIONS[:benchmark] = true if ARGV.include?("-benchmark")
	
	if algorithm_type = ARGV.find {|a| ALGORITHMS.keys.include?(a)}
		OPTIONS[:algorithm] = ALGORITHMS[algorithm_type]
	end
	# checking ARGV in this way ignores multiple algorithm args being passed and just grabs the first

	if range = ARGV.find {|a| a.include?("range:") }
		range = range.gsub("-range:", "").split("-").map(&:to_i)
		# passing a range argument with '-range:10-20' requires some careful parsing since
		# I wanted the argument to be flexible as either a range or a limit
		range.length >= 2 ? OPTIONS[:range] = (range.first..range.last) : OPTIONS[:range] = range.first
	end
end	


# Driver code

parse_args if ARGV.any?
app = App.new(OPTIONS)
app.run


