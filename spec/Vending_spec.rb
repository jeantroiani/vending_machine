require 'vending'

describe Vending do
		
	context 'has' do

		let	(:container){Container.new}
		let (:machine) 	{Vending.new( products: container )}

		it 'an accesible product container when created' do
			expect(machine.products.items).to eq([])
		end 

	end

	context 'can' do

		let	(:cake)     {double "cake", price: 59}
		let (:currency) {Currency.new}
		let	(:cash)			{Cash.new(currency)}
		let	(:container){Container.new}
		let (:machine)  {Vending.new( products: container, cash: cash)}

		it 'can load a product' do
			machine.products.load(cake)
			expect(machine.products.items).to eq([cake])	
		end

		it 'release a product' do
			machine.products.load(cake)
			machine.products.release(cake)
			expect(machine.products.items).to eq([])	
		end

		it 'calculates difference between price and amount inserted' do
			cost 	 = 0.99
			amount = 1
			expect(machine.difference(cost,amount)).to eq(0.01)
		end

		it 'can sell an item of 99p and give change for a pound' do
			cake = double :cake, price: 0.99
			machine.cash.insert(2, :pound)
			machine.cash.insert(2, :pence)
			machine.products.load(cake)
			machine.buy(cake, 1 , :pound)
			expect(machine.cash.coin_container[:pound]).to eq(8)
			expect(machine.cash.coin_container[:pence]).to eq(6)
			expect(machine.products.items).to eq([])
		end

	end

end


