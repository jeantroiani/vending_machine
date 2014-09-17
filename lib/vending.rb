require_relative 'product'
require_relative 'calculator'

class Vending

	attr_accessor :products 
	attr_accessor	:cash

	def initialize
		@products = []
		
		@cash = { two_pounds: 0,
					 	 pound: 0,
					 	 fifty_pence: 0,
					   twenty_pence: 0,
					   ten_pence: 0,
					   five_pence: 0,
					   two_pence: 0,
					   pence: 0
					 }
	
		@pence        = 0.01
		@two_pence    = 0.02
		@five_pence   = 0.05
		@ten_pence    = 0.10
		@twenty_pence = 0.20
		@fifty_pence  = 0.50
		@pound        = 1.0
		@two_pounds   = 2.0
	
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

	def buy(item,amount_inserted,money_type)
		if item.price < amount_inserted
			release(item)
			give_back(amount_result,money_type)
		else
			puts 'Not enough money, try again'
		end
	end

	def difference(cost,amount)
		cost < amount ? (amount-cost).round(2):nil 
	end



	def change(amount)

		if amount >= @two_pounds && cash[:two_pounds] > 0
			two_pounds_change = (amount / @two_pounds).floor
			amount -= two_pounds_change * @two_pounds
			amount = amount.round(2)
			@cash[:two_pounds] -= two_pounds_change
			puts "you will receive #{two_pounds_change} two pounds coins"
		end



		if amount >= @pound && amount > 0 && cash[:pound] > 0
			one_pound_change = (amount / @pound).floor 
			amount -= (one_pound_change * @pound).round(2)
			amount = amount.round(2)
			@cash[:pound]-= one_pound_change
			puts "you will receive #{one_pound_change} one pound coins"
		end
		
	
		if amount >= @fifty_pence && amount != 0 && cash[:fifty_pence] > 0
			fifty_pence_change = (amount / @fifty_pence).floor
			amount -= (fifty_pence_change * @fifty_pence).round(2)
			amount = amount.round(2)
			@cash[:fifty_pence]-= fifty_pence_change
			# puts "you will receive #{fifty_pence_change} fifty pence coins"
		end

		if amount >= @twenty_pence && amount != 0 && cash[:twenty_pence] > 0
			twenty_pence_change = (amount / @twenty_pence).floor
			amount -= (twenty_pence_change * @twenty_pence).round(2)
			amount = amount.round(2)
			@cash[:twenty_pence]-= twenty_pence_change
			# puts "you will receive #{twenty_pence_change} twenty pence coins"
		end

		if amount >= @ten_pence && amount != 0 && cash[:ten_pence] > 0
			ten_pence_change = (amount / @ten_pence).floor
			amount -= (ten_pence_change * @ten_pence).round(2)
			amount = amount.round(2)
			@cash[:ten_pence]-= ten_pence_change
			# puts "you will receive #{ten_pence_change} ten pence coins"

		end

		if amount >= @five_pence && amount != 0 && cash[:five_pence] > 0
			five_pence_change = (amount / @five_pence).floor
			amount -= (five_pence_change * @five_pence).round(2)
			amount = amount.round(2)
			@cash[:five_pence]-= five_pence_change
			# puts "you will receive #{five_pence_change} five pence coins"
		end

		if amount >= @two_pence && amount != 0 && cash[:two_pence] > 0
			two_pence_change = (amount / @two_pence).floor
			amount -= (two_pence_change * @two_pence).round(2)
			amount = amount.round(2)
			@cash[:two_pence]-= two_pence_change
			# puts "you will receive #{two_pence_change} two pence coins"
		end

		if amount >= @pence && amount != 0 && cash[:pence] > 0
			pence_change = (amount / @pence).floor
			amount -= (pence_change * @pence).round(2)
			amount = amount.round(2)
			@cash[:pence]-= pence_change
			# puts "you will receive #{pence_change} pence coins"
		end
	
	end

end
