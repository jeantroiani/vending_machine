class Cash

	attr_accessor :coin_container
	attr_accessor :currency

	def initialize(currency)
		
		@currency = currency
		
		@coin_container = { 
			two_pounds:   5,
			pound:        5,
			fifty_pence:  5,
			twenty_pence: 5, 
		  ten_pence:    5,
			five_pence:   5,
			two_pence:    5,
			pence:        5
		}
	end

	def insert(amount, size)
		coin_container[size]+= amount 
	end

	def release(amount, size)
		coin_container[size]-= amount 
	end

	def iteration(array)
		array.each_pair.map {|size, amount| currency.unit_conversion(amount, size)} 
	end

	def reduce_money(collection)
		collection.inject{|sum,el| sum + el}.round(2)
	end

	def money_available
		reduce_money(iteration(coin_container))
	end

	def give_change(amount)
		@amount = amount   
		coin_container.each_pair {|size,index| change_sort(@amount, size)} 
	end

	def change_sort(amount, size)
			sorting(amount, size) 
			coin_container[size] -= @current_currency_total		
	end

	def sorting(amount, size)
		@current_currency_total=0
		if amount >= currency.denomination[size] && amount > 0 && coin_container[size] > 0
			@current_currency_total = (amount / currency.denomination[size]).floor
			amount -= @current_currency_total * currency.denomination[size]
			@amount = amount.round(2)
		end
	end
	
end
