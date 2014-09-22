
require_relative 'cash'
require_relative 'product'
require_relative 'currency'
require_relative 'container'
require_relative 'messages'

class Vending

include Messages

	attr_accessor	:cash
	attr_accessor :products 

	def initialize(args)
		@cash 		= args[:cash]
		@products = args[:products]
	end

	def difference(cost, amount_inserted)
		(amount_inserted-cost).round(2)
	end

	def buy(item, amount, size )
		@amount_inserted = 0 
		amount_to_deposit(amount, size)
		enough_cash?(item, @amount_inserted)
		products.release(item)
		cash.give_change(difference(item.price, @amount_inserted))
	end

	def enough_cash?(item, amount)
		amount < item.price
		ask_for_more(item)
	end

	def ask_for_more(item)
			while @amount_inserted < item.price
			self.ask_for_more_money
			amount_update = gets.chomp.split(" ")
			amount_to_deposit(amount_update[0].to_i, amount_update[1].to_sym)
			end
	end

	def amount_to_deposit(amount, size)
		cash.insert(amount, size)
		@amount_inserted += cash.currency.unit_conversion(amount, size)
	end

end

	
	
