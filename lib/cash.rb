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

	def insert(amount, money_type)
		coin_container[money_type]+= amount 
	end

	def release(amount, money_type)
		coin_container[money_type]-= amount 
	end

	def value_iteration_with_index
		coin_container.values.each_with_index {|amount, index| money_available(amount, index)} 
	end

	def money_available(amount, grade)
		reduce_money(currency.unit_conversion(amount, grade))
	end

	def reduce_money(collection)
		@collection ||=[]
		@collection << collection 
		collection.inject{|sum,el| sum + el}
	end
	
end



	# def money_available
	# 	# @each_of_updated = []
	# 	self.cash.values.each_with_index{|amount, index| @each_of_updated <<  amount * @denomination[index]}
	# 	reduce_money(collection)
	# end
