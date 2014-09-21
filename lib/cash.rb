class Cash

	attr_accessor :coin_container
	attr_accessor :currency

	def initialize(currency)
		@currency = currency
		@coin_container = { 
			two_pounds:   0,
			pound:        0,
			fifty_pence:  0,
			twenty_pence: 0, 
		  ten_pence:    0,
			five_pence:   0,
			two_pence:    0,
			pence:        0
		}
	end

	def insert(amount, grade)
		coin_container[grade]+= amount 
	end

	def release(amount, grade)
		coin_container[grade]-= amount 
	end

	def iteration
		coin_container.each_pair.map {|grade, amount| currency.unit_conversion(amount, grade)} 
	end

	def reduce_money(collection)
		collection.inject{|sum,el| sum + el}
	end

	def money_available
		reduce_money(iteration)
	end
	
end
