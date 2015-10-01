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
	# checking ARGV in this way ignores multiple algorithm args being passed from the command line

	if range = ARGV.find {|a| a.include?("range:") }
		range = range.gsub("-range:", "").split("-").map(&:to_i)
		
		range.length >= 2 ? OPTIONS[:range] = (range.first..range.last) : OPTIONS[:range] = range.first
	end
end	


#runcode

parse_args if ARGV.any?
app = App.new(OPTIONS)
app.run


