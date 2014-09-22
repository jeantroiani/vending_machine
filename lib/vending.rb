
require_relative 'cash'
require_relative 'product'
require_relative 'currency'
require_relative 'container'

class Vending

	attr_accessor	:cash
	attr_accessor :products 

	def initialize(args)
		@cash 		= args[:cash]
		@products = args[:products]

	end

	def buy(item, amount , size ) 
		cash.insert(amount, size)
		amount_inserted = cash.currency.unit_conversion(amount, size)
		while amount_inserted < item.price
			puts "please insert more e.g.(1 pound)"
			amount_update = gets.chomp.split(" ") 
			amount_inserted += cash.currency.unit_conversion(amount_update[0].to_i,amount_update[1].to_sym	)
			cash.insert(amount_update[0].to_i, amount_update[1].to_sym)
		end
		products.release(item)
		cash.give_change(difference(item.price, amount_inserted ))
	end

	def difference(cost, amount_inserted)
		(amount_inserted-cost).round(2)
	end

end

	
	
