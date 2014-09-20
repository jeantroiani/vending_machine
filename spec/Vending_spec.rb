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
		let	(:container){Container.new}
		let (:machine)  {Vending.new( products: container )}

		it 'can load a product' do
			machine.products.load(cake)
			expect(machine.products.items).to eq([cake])	
		end

		it 'release a product' do
			machine.products.load(cake)
			machine.products.release(cake)
			expect(machine.products.items).to eq([])	
		end

		xit 'can load 3 pound' do
			machine.insert(3, :pound)
			expect(machine.cash[:pound]).to eq(13)
		end

		xit 'can receive 1 pence' do
			machine.insert(1, :pence)
			expect(machine.cash[:pence]).to eq(11)
		end

		xit 'can give back 2 pound' do
			machine.insert(3, :pound)
			machine.give_back(2, :pound)
			expect(machine.cash[:pound]).to eq(11)
		end

		xit 'can sell an xitem of 99p and give change for a pound' do
			cake = double :cake, price: 0.99
			machine.load(cake)
			machine.buy(cake, 1)
			expect(machine.cash[:pound]).to eq(11)
			expect(machine.products).to eq([])
			expect(machine.cash[:pence]).to eq(9)
		end

		xit 'calculates difference between price and amount inserted' do
			cost 	 = 0.99
			amount = 1
			expect(machine.difference(cost,amount)).to eq(0.01)
		end

		xit 'sorts change' do
			machine.change(3.5)
			expect(machine.cash[:two_pounds]).to eq(9)
			expect(machine.cash[:pound]).to eq(9)
			expect(machine.cash[:fifty_pence]).to eq(9)
		end

		xit 'sorts payment' do
			machine.payment(2.21)
			expect(machine.cash[:two_pounds]).to eq(11)
			expect(machine.cash[:twenty_pence]).to eq(11)
			expect(machine.cash[:pence]).to eq(11)
		end  

		xit 'tracks product that has available' do
			cake = double :cake, price: 0.99
			pie = double :pie , price: 1.55
			machine.load(cake)
			machine.load(pie)
			expect(machine.products.size).to eq(2)
		end

		xit 'tracks cash that has available' do
			machine.insert(2, :pound)
			machine.insert(2, :pence)
			expect(machine.cash_available).to eq(40.82)
		end
	end

end


