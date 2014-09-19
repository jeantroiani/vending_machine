require 'vending'

describe Vending do
		
	context 'has' do
		
		let(:machine) {Vending.new}
			
		it 'a product container when created' do
			expect(machine.products).to eq([])
		end 

	end

	context 'can' do

		let(:machine) {Vending.new}

		it 'can load a product' do
			cake = double :cake, price: 59
			machine.load(cake)
			expect(machine.products).to eq([cake])	
		end

		it 'release a product' do
			cake = double :cake, price: 59
			machine.load(cake)
			machine.release(cake)
			expect(machine.products).to eq([])	
		end

		it 'can load 3 pound' do
			machine.insert(3, :pound)
			expect(machine.cash[:pound]).to eq(13)
		end

		it 'can load 1 pence' do
			machine.insert(1, :pence)
			expect(machine.cash[:pence]).to eq(11)
		end

		it 'can give back 2 pound' do
			machine.insert(3, :pound)
			machine.give_back(2, :pound)
			expect(machine.cash[:pound]).to eq(11)
		end

		it 'can sell an item of 99p and give change for a pound' do
			cake = double :cake, price: 0.99
			machine.load(cake)
			machine.buy(cake, 1)
			expect(machine.cash[:pound]).to eq(11)
			expect(machine.products).to eq([])
			expect(machine.cash[:pence]).to eq(9)
		end

		it 'calculates difference between price and amount inserted' do
			cost 	 = 0.99
			amount = 1
			expect(machine.difference(cost,amount)).to eq(0.01)
		end

		it 'tracks product that has available' do
			cake = double :cake, price: 0.99
			pie= double :pie , price: 1.55
			machine.load(cake)
			machine.load(pie)
			expect(machine.products.size).to eq(2)
		end

		it 'tracks cash that has available' do
			machine.insert(2, :pound)
			machine.insert(2, :pence)
			expect(machine.cash_available).to eq(40.82)
		end
	end

end


