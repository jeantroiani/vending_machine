require_relative 'product'

class Vending

	attr_accessor :products 
	attr_accessor	:cash

	def initialize
		@products = []
		
		@cash = { 
			two_pounds: 10,
			pound: 10,
			fifty_pence: 10,
			twenty_pence: 10,
		  ten_pence: 10,
			five_pence: 10,
			two_pence: 10,
			pence: 10
			}

	  @denomination =[	
			@two_pounds   = 2.0,
			@pound        = 1.0,
			@fifty_pence  = 0.50,
			@twenty_pence = 0.20,
			@ten_pence    = 0.10,
			@five_pence   = 0.05,
			@two_pence    = 0.02,
			@pence        = 0.01,
		]
	end

	def load(item)
		products << item
	end

	def release(item)
		products.delete(item)
	end

	def insert(amount, money_type)
		cash[money_type]+= amount 
	end

	def give_back(amount, money_type)
		cash[money_type]-= amount 
	end

	def buy(item, amount_inserted)
		if item.price < amount_inserted
			release(item)
			payment(amount_inserted)
			change(difference(item.price,amount_inserted))
		else
			puts 'Not enough money, try again'
		end
	end

	def difference(cost, amount_inserted)
		cost < amount_inserted ? (amount_inserted-cost).round(2):nil 
	end

	def total_message(update)
		@message = ""
		print @message << update+"\n"
	end
	
	def change(amount)
		@amount = amount
		@cash.keys.each_with_index {|key,index| change_sort(@amount, @denomination[index], key)}
		@total_message
	end

	def change_sort(amount, currency, cash_type)
		if amount >= currency && amount > 0 && cash[cash_type] > 0
			current_currency_total = (amount / currency).floor
			amount -= current_currency_total * currency
			@amount = amount.round(2)
			@cash[cash_type] -= current_currency_total
			total_message("you received back #{current_currency_total} of #{currency}")
		end
	end

	def payment(amount)
		@amount = amount
		@cash.keys.each_with_index {|key,index| payment_sort(@amount, @denomination[index], key)}
	end

	def payment_sort(amount, currency, cash_type)
		if amount >= currency && amount > 0
			current_currency_total = (amount / currency).floor
			amount -= current_currency_total * currency
			@amount = amount.round(2)
			@cash[cash_type] += current_currency_total
		end
	end

	def cash_available
		self.cash.values.inject {|sum,ele| sum + ele }
	end

end
