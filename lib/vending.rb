
require_relative 'product'
require_relative 'container'
require_relative 'cash'
require_relative 'currency'

class Vending

	attr_accessor	:cash
	attr_accessor :products 
	attr_accessor :currency

	def initialize(args)
		@cash 				= args[:cash]
		@products 		= args[:products]
		@currency     = args[:currency]
	end


	def buy(item, amount_inserted)
		if item.price < amount_inserted
			products.release(item)
			cash.payment(amount_inserted)
			change(difference(item.price,amount_inserted))
		else
			puts 'Not enough money, try again'
		end
	end


	

	# def give_back(amount, money_type)
	# 	cash[money_type]-= amount 
	# end


	# def difference(cost, amount_inserted)
	# 	cost < amount_inserted ? (amount_inserted-cost).round(2):nil 
	# end
	
	# def change(amount)
	# 	@amount = amount
	# 	@cash.keys.each_with_index {|key,index| change_sort(@amount, @denomination[index], key)}
	# end

	# def payment(amount)
	# 	@amount = amount
	# 	@cash.keys.each_with_index {|key,index| payment_sort(@amount, @denomination[index], key)}
	# end
	
	# def change_sort(amount, currency, cash_type)
	# 		sorting(amount, currency, cash_type)
	# 		@cash[cash_type] -= @current_currency_total		
	# end

	# def payment_sort(amount, currency, cash_type)
	# 		sorting(amount, currency, cash_type)
	# 		@cash[cash_type] += @current_currency_total
	# end

	# def sorting(amount, currency, cash_type)
	# 	@current_currency_total=0
	# 	if amount >= currency && amount > 0 && @cash[cash_type] > 0
	# 		@current_currency_total = (amount / currency).floor
	# 		amount -= @current_currency_total * currency
	# 		@amount = amount.round(2)
	# 	end
	# end

end
