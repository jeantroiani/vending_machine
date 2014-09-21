class Currency

	attr_accessor :denomination

  def initialize

	  @denomination = {
			two_pounds:    2.0,
			pound:         1.0,
			fifty_pence:   0.50,
			twenty_pence:  0.20,
			ten_pence:     0.10,
			five_pence:    0.05,
			two_pence:     0.02,
			pence:         0.01,
		  }

	end

	def grade(name)
		denomination[name]
	end
	
	def unit_conversion (amount, grade)
		amount * grade
	end

end