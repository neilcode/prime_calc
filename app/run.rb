require_relative 'app'

OPTIONS = {
	benchmark: false,
	range: 10,
	algorithm: Fermat
}

ALGORITHMS = {
	'-bf' => BruteForce,
	'-td' => TrialDivision,
	'-f'  => Fermat
}

def parse_args
	OPTIONS[:benchmark] = true if ARGV.include?("-benchmark")
	
	if algorithm_type = ARGV.find {|a| ALGORITHMS.keys.include?(a)}
		OPTIONS[:algorithm] = ALGORITHMS[algorithm_type]
	end

	if range = ARGV.find {|a| a.include?("range:") }
		range = range.gsub("-range:", "").split("-").map(&:to_i).last(2)
		
		range.length >= 2 ? OPTIONS[:range] = (range.first..range.last) : OPTIONS[:range] = range.first
	end
end	


#runcode

parse_args if ARGV.any?
puts OPTIONS
app = App.new(OPTIONS)
app.run


